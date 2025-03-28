#!/bin/bash
# Copyright (c) 2019 Gonçalo Baltazar <me@goncalomb.com>
# MIT License

# Open a root shell on a Kubernetes cluster Node (no ssh).
# The node is selected by name, and we resolve the actual value of `kubernetes.io/hostname`.

# usage: k8s-node-gate.sh <node-name>

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <node-name>"
  exit 1
fi

NODE_NAME=$1

# Resolve the value of the node's kubernetes.io/hostname label
NODE_HOSTNAME=$(kubectl get node "$NODE_NAME" -o jsonpath='{.metadata.labels.kubernetes\.io/hostname}')

if [ -z "$NODE_HOSTNAME" ]; then
  echo "Error: Could not resolve 'kubernetes.io/hostname' label for node '$NODE_NAME'"
  exit 1
fi

kubectl -n kube-system run "node-gate-${NODE_NAME}" -it --rm --restart=Never \
  --image=busybox:latest \
  --overrides="$(cat <<EOF
{
  "spec": {
    "nodeSelector": {
      "kubernetes.io/hostname": "${NODE_HOSTNAME}"
    },
    "hostPID": true,
    "hostIPC": true,
    "hostNetwork": true,
    "containers": [
      {
        "name": "node-gate",
        "image": "busybox:latest",
        "stdin": true,
        "tty": true,
        "command": ["chroot", "/mnt/host", "/bin/bash"],
        "securityContext": {
          "privileged": true
        },
        "volumeMounts": [
          {
            "name": "host",
            "mountPath": "/mnt/host"
          }
        ]
      }
    ],
    "tolerations": [
      {
        "key": "node-role.kubernetes.io/etcd",
        "operator": "Exists",
        "effect": "NoSchedule"
      },
      {
        "key": "node.kubernetes.io/etcd",
        "operator": "Exists",
        "effect": "NoSchedule"
      },
      {
        "effect": "NoSchedule",
        "operator": "Exists"
      },
      {
        "effect": "NoExecute",
        "operator": "Exists"
      }
    ],
    "volumes": [
      {
        "name": "host",
        "hostPath": {
          "path": "/"
        }
      }
    ]
  }
}
EOF
)"

# Ansible Ubuntu Setup

## Prerequisites

* Ubuntu 22.04
* AMD64 architecture, Windows 11 host PC

## Features

Edit the [variables](variables.yml) file to enable/disable features this playbook provides

Features:
* ✅ Zsh
* ✅ Kubectl
* ✅ Apt-packages: yq, jq, python3, telnet, unzip, direnv, openssl, plocate 
* ✅ Docker
* ✅ Helm
* ✅ Terraform
* ✅ Kubectx
* ✅ Kubens
* ✅ Kubecolor
* ✅ git-delta

## Install

1. Download or clone this repo
1. cd to the root of this repo
1. Run `sudo apt update -y && sudo apt install dos2unix && find . -type f -exec dos2unix {} \; && bash bootstrap.sh`

### WSL

1. Download or clone this repo
1. Copy this repo to the WSL distro:

```Powershell
Copy-Item -Path "C:\Users\user\Documents\repos\os-setup\linux" -Destination "\\wsl.localhost\Ubuntu-22.04\home\user" -Recurse -Force
```

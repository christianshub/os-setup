# Ansible Ubuntu Setup

Installs packages and plugins relevant to an engineer working with Kubernetes.
Leverages the use of Ansible and Homebrew to install tools.

## Features

Packages and plugins:

- ✅ Zsh
- ✅ Kubectl
- ✅ Golang
- ✅ Apt-packages: yq, jq, python3, telnet, unzip, direnv, openssl, plocate, ca-certificates, curl, wget, pass, xorriso
- ✅ Docker
- ✅ Helm
- ✅ Terraform
- ✅ Fzf
- ✅ Kubectx
- ✅ Kubens
- ✅ Kubecolor
- ✅ git-delta
- ✅ Packer

## TODO

- Create GPG ready to be exported to GitHub

## Prerequisites

- Ubuntu 22.04
- AMD64 architecture, Windows 11 host PC

## Install

1. Download or clone this repo
1. cd to the root of this repo
1. Run `sudo apt update -y && sudo apt install dos2unix && find . -type f -exec dos2unix {} \; && bash bootstrap.sh`

```bash
sudo apt update -y && sudo apt install dos2unix && find . -type f -exec dos2unix {} \; && bash bootstrap.sh
```

1. After installation reopen your terminal for changes to take effect.

### WSL

1. Download or clone this repo
1. Copy this repo to the WSL distro:

```Powershell
Copy-Item -Path "C:\Users\user\Documents\repos\os-setup\linux" -Destination "\\wsl.localhost\Ubuntu-22.04\home\user" -Recurse -Force
```

> Note, the \<user\> name may be different from what you have chosen

1. From within your Ubuntu Distro, go to the copied folder and run:

```bash
sudo apt update -y && sudo apt install dos2unix && find . -type f -exec dos2unix {} \; && bash bootstrap.sh
```

1. After installation reopen your terminal for changes to take effect.

## vscode plugins

Needs to be installed manually right now. Suggested plugins:

- NewLine
- Rainbow CSV
- Rewrap
- Trailing Whitespace
- Prettier
- Rainglow (theme: darkside)

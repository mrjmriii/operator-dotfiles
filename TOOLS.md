# Tooling Baseline

This list is intentionally conservative: common, portable tools that support
infra + SOC work without adding risk or bloat.

## Core shell + filesystem
- bash, zsh
- coreutils
- findutils
- less

## Git + workflow
- git
- pre-commit

## Networking + diagnostics
- iproute2 (ip, ss)
- net-tools (legacy ifconfig, netstat)
- tcpdump
- traceroute / mtr
- nmap
- dig (dnsutils)

## TLS + HTTP
- curl
- wget
- openssl

## Data + parsing
- jq
- yq
- ripgrep (rg)
- awk/sed

## Editors
- vim or neovim
- nano (fallback)

## Optional UX
- fzf
- eza or exa
- bat
- tmux
- htop
- ncdu

## Python + automation
- python3
- python3-venv
- pipx
- pip

## Security tooling (lab)
- wireshark + tshark
- socat

Use your system package manager to install.

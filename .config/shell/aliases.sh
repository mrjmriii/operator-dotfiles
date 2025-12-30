#!/usr/bin/env bash
# Minimal aliases (avoid surprising behavior).

if command -v eza >/dev/null 2>&1; then
  alias ll='eza -alF --group-directories-first --git'
  alias la='eza -a'
  alias l='eza -CF --group-directories-first'
elif command -v exa >/dev/null 2>&1; then
  alias ll='exa -alF --group-directories-first --git'
  alias la='exa -a'
  alias l='exa -CF --group-directories-first'
else
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'
fi

alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log --oneline --decorate -n 20'
alias gp='git push'
alias gd='git diff'
alias gds='git diff --staged'

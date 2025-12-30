#!/usr/bin/env bash
# Shared shell defaults (safe, minimal, portable).

set -o nounset

export EDITOR="${EDITOR:-vi}"
export PAGER="${PAGER:-less}"
export LESS="-FRX"

# History defaults (Bash honors HIST*; Zsh reads but uses its own settings).
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '

# PATH hygiene
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

umask 022

#!/usr/bin/env bash
# Entry point for operator shell identity.

set -o nounset

OP_DOTFILES_ROOT="${OP_DOTFILES_ROOT:-$HOME/src/operator-dotfiles}"
SHELL_PROFILE="${SHELL_PROFILE:-default}"
PROFILE_DIR="$OP_DOTFILES_ROOT/.config/shell/profiles/$SHELL_PROFILE"

source "$OP_DOTFILES_ROOT/.config/shell/common.sh"
source "$OP_DOTFILES_ROOT/.config/shell/functions.sh"
source "$OP_DOTFILES_ROOT/.config/shell/aliases.sh"

if [ -f "$PROFILE_DIR/env.sh" ]; then
  source "$PROFILE_DIR/env.sh"
fi
if [ -f "$PROFILE_DIR/profile.sh" ]; then
  source "$PROFILE_DIR/profile.sh"
fi
if [ -f "$PROFILE_DIR/aliases.sh" ]; then
  source "$PROFILE_DIR/aliases.sh"
fi
if [ -f "$PROFILE_DIR/prompt.sh" ]; then
  source "$PROFILE_DIR/prompt.sh"
fi

if [ -n "${BASH_VERSION:-}" ]; then
  source "$OP_DOTFILES_ROOT/.config/shell/bash.sh"
elif [ -n "${ZSH_VERSION:-}" ]; then
  source "$OP_DOTFILES_ROOT/.config/shell/zsh.sh"
fi

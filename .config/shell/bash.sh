#!/usr/bin/env bash
# Bash-specific behavior.

shopt -s histappend checkwinsize

# Activate mise if present.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate bash)"
fi

# Simple, readable prompt.
PS1='\u@\h:\w$(git_branch)\$ '

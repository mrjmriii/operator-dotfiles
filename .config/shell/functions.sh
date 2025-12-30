#!/usr/bin/env bash
# Small helpers used across shells.

set -o nounset

mkcd() {
  mkdir -p "$1" && cd "$1" || return 1
}

git_branch() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return 0
  if [ -n "$branch" ] && [ "$branch" != "HEAD" ]; then
    printf " (%s)" "$branch"
  fi
}

path_prepend() {
  case ":$PATH:" in
    *":$1:"*) return 0 ;;
    *) export PATH="$1:$PATH" ;;
  esac
}

path_append() {
  case ":$PATH:" in
    *":$1:"*) return 0 ;;
    *) export PATH="$PATH:$1" ;;
  esac
}

#!/usr/bin/env bash
# Safe installer for operator dotfiles shell identity.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$ROOT_DIR/.config/shell"
TARGET_DIR="$HOME/.config/shell"
FORCE=false

usage() {
  cat <<'USAGE'
Usage: ./install.sh [--force]

Creates a symlink:
  ~/.config/shell -> <repo>/.config/shell

Flags:
  --force   Backup existing target and replace.
USAGE
}

if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
  usage
  exit 0
fi

if [ "${1:-}" = "--force" ]; then
  FORCE=true
fi

if [ ! -d "$SOURCE_DIR" ]; then
  echo "ERROR: $SOURCE_DIR not found."
  exit 1
fi

mkdir -p "$HOME/.config"

if [ -L "$TARGET_DIR" ]; then
  current_target="$(readlink "$TARGET_DIR")"
  if [ "$current_target" = "$SOURCE_DIR" ]; then
    echo "OK: $TARGET_DIR already points to $SOURCE_DIR"
    exit 0
  fi
  if [ "$FORCE" = true ]; then
    rm -f "$TARGET_DIR"
  else
    echo "WARN: $TARGET_DIR is a symlink to $current_target"
    echo "      Use --force to replace it."
    exit 1
  fi
elif [ -e "$TARGET_DIR" ]; then
  if [ "$FORCE" = true ]; then
    backup="$TARGET_DIR.bak.$(date +%Y%m%d%H%M%S)"
    mv "$TARGET_DIR" "$backup"
    echo "Backed up existing $TARGET_DIR to $backup"
  else
    echo "WARN: $TARGET_DIR exists and is not a symlink."
    echo "      Use --force to back it up and replace."
    exit 1
  fi
fi

ln -s "$SOURCE_DIR" "$TARGET_DIR"
echo "Linked $TARGET_DIR -> $SOURCE_DIR"

cat <<'NEXT'
Next steps:
1) Add this to ~/.zshrc (or ~/.bashrc):
   source ~/.config/shell/init.sh
2) Optional profile override:
   export SHELL_PROFILE=default
NEXT

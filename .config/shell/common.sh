# --------------------------------------------------
# Common shell configuration
#
# Purpose:
# - Human-facing defaults
# - Portable across bash and zsh
# - No shell-specific syntax
#
# This file is safe to source from any POSIX shell.
# --------------------------------------------------

# NOTE:
# Icons intentionally disabled.
# Rationale: cleaner output, better SSH/log readability,
# less visual noise for infrastructure work.


# eza: opinionated defaults with override support
eza() {
  command eza \
    --long \
    --group \
    --git \
    --header \
    --group-directories-first \
    --time-style=iso \
    "$@"
}

# Semantic views (mental model commands)
alias audit='eza --long --git'
alias topo='eza --tree --level=3 --group-directories-first'
alias reveal='eza --all --long --git'
alias iac-tree='eza --tree --level=4 --group-directories-first'

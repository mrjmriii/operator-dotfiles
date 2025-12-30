# Zsh-specific behavior.

setopt hist_ignore_dups hist_ignore_space hist_reduce_blanks
setopt append_history inc_append_history share_history
setopt extended_history
setopt autocd

HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
HISTSIZE="${HISTSIZE:-10000}"
SAVEHIST="${SAVEHIST:-20000}"

# Activate mise if present.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

setopt prompt_subst
PROMPT='%n@%m:%~$(git_branch)%# '

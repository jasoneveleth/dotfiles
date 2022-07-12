#!/bin/zsh

PROMPT="[%m:%1~]%# "
# prints if exit code is nonzero, %(cond.consq.alt) is the replacement
RPROMPT="%(?..%F{1}%?%F{0})"
[ -n "$NNNLVL" ] && PROMPT="N$NNNLVL $PROMPT"
[ -n "$NVIM" ] && export EDITOR="nvim --server $NVIM --remote" && export VISUAL="$EDITOR"

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt interactive_comments
setopt inc_append_history # remove 'inc_' to add when session exits
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_find_no_dups # don't find duplicates when searching in the line editor
setopt promptsubst

source "$ZDOTDIR/"keybinds.zsh
source "$ZDOTDIR/"completion.zsh
source "$ZDOTDIR/"aliases.zsh
source "$ZDOTDIR/"conda.zsh

source "$XDG_CONFIG_HOME/"zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ^ strange quoting allows for `gf` to work in vim

# remove duplicates
typeset -U path

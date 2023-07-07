#!/bin/zsh

PROMPT="%(?.;.%F{1};%F{0}) "
# prints if exit code is nonzero, %(cond.consq.alt) is the replacement
[ -n "$NNNLVL" ] && PROMPT="N$NNNLVL $PROMPT"
[ -n "$NVIM" ] && export EDITOR="nvim --server $NVIM --remote" && export VISUAL="$EDITOR"

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt interactive_comments
setopt inc_append_history # remove 'inc_' to add when session exits
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_find_no_dups # don't find duplicates when searching in the line editor
setopt promptsubst
setopt pipe_fail # set exit status of a pipe to error if one of them errors

source "$ZDOTDIR/"keybinds.zsh
source "$ZDOTDIR/"completion.zsh
source "$ZDOTDIR/"aliases.zsh
source "$ZDOTDIR/"conda.zsh
source "$ZDOTDIR/"git-repo-check.zsh
source "$ZDOTDIR/"wezterm.sh

source "$XDG_CONFIG_HOME/"zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ^ strange quoting allows for `gf` to work in vim

# remove duplicates
typeset -U path


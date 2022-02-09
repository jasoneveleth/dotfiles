#!/bin/zsh

PS1="[%m:%1~]%# "
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
[ -n "$NVIM_LISTEN_ADDRESS" ] && export EDITOR="nvr --remote-wait" && export VISUAL="$EDITOR"

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt interactive_comments
setopt inc_append_history # remove 'inc_' to add when session exits
setopt hist_ignore_all_dups

source "$ZDOTDIR/"keybinds.zsh
source "$ZDOTDIR/"completion.zsh
source "$ZDOTDIR/"aliases.zsh

if [[ `uname -m` == 'arm64' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
source "$XDG_CONFIG_HOME/"zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ^ strange quoting allows for `gf` to work in vim


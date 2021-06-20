#!/bin/zsh

PS1="[%m:%1~]%# "

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt interactive_comments
setopt inc_append_history # remove 'inc_' to add when session exits
setopt hist_ignore_all_dups

# directory history. ex % dirs -v or % cd -<num>
export DIRSTACKSIZE=100
setopt autopushd pushdminus pushdsilent

source "$ZDOTDIR/"keybinds.zsh
source "$ZDOTDIR/"completion.zsh
source "$ZDOTDIR/"aliases.zsh

source "$XDG_CONFIG_HOME/"zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ^ strange quoting allows for `gf` to work in vim

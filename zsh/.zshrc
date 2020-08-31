#!/bin/sh
# shellcheck source=/Users/jasoneveleth/.config/zsh/aliases
. "$XDG_CONFIG_HOME"/zsh/aliases
# shellcheck source=/Users/jasoneveleth/.config/zsh/functions
. "$XDG_CONFIG_HOME"/zsh/functions
[ -f "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env" ] && . "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env"
export PS1="%{$(tput rev)%}%m%{$(tput sgr0)%} %# "
export RPROMPT='%{%F{8}%}%~%{%f%}'
export HOMEBREW_NO_AUTO_UPDATE=1

setopt interactive_comments
# case insensitive and underscores ignored
setopt hist_ignore_dups
setopt share_history
setopt correct
setopt autocd

# nice autocompletion
autoload -Uz compinit
compinit -d ~/.local/share/zsh/.zcompdump
# include hidden files
_comp_options+=(globdots)

# directory history. ex % dirs -v % cd -<num>
export DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# vim bindings
bindkey -v
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1
# completion of command using most recent match in history with vim completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins "^p" up-line-or-beginning-search
bindkey -M viins "^n" down-line-or-beginning-search

# attach to "general" tmux session or makes one
if command -v tmux 1> /dev/null 2>&1 && [ -z "$TMUX" ]; then
  ! tmux attach -t general 2>/dev/null && tmux new -s general
fi

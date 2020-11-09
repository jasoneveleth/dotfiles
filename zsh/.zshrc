#!/bin/zsh

[ -f "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env" ] && . "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env"

# not exported because it is bad practice to export zsh variables, only other
# program's. When a zsh variable is exported it makes it availible system-wide,
# rather than just for that session
PS1="%{$(tput rev)%}%m%{$(tput sgr0)%} %# "
RPROMPT='%{%F{8}%}%~%{%f%}'

setopt hist_ignore_space
setopt hist_ignore_dups
setopt interactive_comments
setopt share_history
setopt correct
setopt autocd

# use autocompletion
autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompcache/.zcompdump
_comp_options+=(globdots) # include hidden files

# directory history. ex % dirs -v % cd -<num>
export DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# enter vi mode
KEYTIMEOUT=1
bindkey -v
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# completion of command using most recent match in history with vim completion
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search

# get direnv, and pyenv working
eval "$(direnv hook zsh)"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# attach to "general" tmux session or makes one
if command -v tmux 1> /dev/null 2>&1 && [ -z "$TMUX" ]; then
    tmux attach -t general 2>/dev/null || tmux new -s general
fi


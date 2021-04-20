# bindkey "^?" backward-delete-char
# bindkey "^U" backward-kill-line
# bindkey "^W" backward-kill-word

# bindkey "^p" history-beginning-search-backward
# bindkey "^n" history-beginning-search-forward

# EPS1='%{%F{8}%}%~%{%f%}'
# ESP1=''
# RPROMPT=$EPS1

# # https://dougblack.io/words/zsh-vi-mode.html {{{
# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="[% NORMAL]%"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select
# # }}}

# emacs/readline
autoload -U edit-command-line
zle -N edit-command-line

bindkey -e
bindkey '^x^e' edit-command-line
bindkey "^u" backward-kill-line
bindkey "^k" kill-line


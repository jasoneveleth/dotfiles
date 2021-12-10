# allow '^s' to be used
stty sane

# bindkey "^?" backward-delete-char
# bindkey "^W" backward-kill-word
# bindkey '^[[A' history-beginning-search-backward
# bindkey '^[[B' history-beginning-search-forward

autoload edit-command-line
zle -N edit-command-line

bindkey -e
bindkey '^x^e' edit-command-line
bindkey "^u" backward-kill-line
bindkey "^k" kill-line

# allow ctrl-r to take current text on commandline
_history-incremental-search-backward () {
    zle .history-incremental-search-backward $BUFFER
}
zle -N history-incremental-search-backward _history-incremental-search-backward

# -s to translate ^M
bindkey -s '^n' 'nnn^M'

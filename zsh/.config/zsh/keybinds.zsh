# allow '^s' to be used
stty -ixon

# bindkey "^?" backward-delete-char
# bindkey "^W" backward-kill-word
# bindkey '^[[A' history-beginning-search-backward
# bindkey '^[[B' history-beginning-search-forward

# allow ctrl-r to take current text on commandline
_history-incremental-search-backward () {
    zle .history-incremental-search-backward $BUFFER
}
zle -N history-incremental-search-backward _history-incremental-search-backward

scroll-and-clear-screen() {
  local i=1
  while read; do ((i++)); done <<< $PS1
  printf '\n%.0s' {$i..$LINES}
  zle clear-screen
}
zle -N scroll-and-clear-screen

autoload edit-command-line
zle -N edit-command-line

bindkey -e
bindkey '^x^e' edit-command-line
bindkey "^u" backward-kill-line
bindkey "^k" kill-line
bindkey '^[[Z' reverse-menu-complete
bindkey '^l' scroll-and-clear-screen

# -s to translate ^M
bindkey -s '^n' 'nnn^M'

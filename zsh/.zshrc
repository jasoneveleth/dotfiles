source ~/.config/zsh/aliases
source ~/.config/zsh/functions
export PROMPT='%{%F{3}%}>%{%f%} '
export RPROMPT='%{%F{8}%}%~%{%f%}'
export HOMEBREW_NO_AUTO_UPDATE=1

setopt interactive_comments
setopt hist_ignore_dups # case insensitive and underscores ignored
setopt share_history
setopt correct
setopt autocd
bindkey -v
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1
autoload -Uz compinit
compinit -d ~/.local/share/zsh/.zcompdump
_comp_options+=(globdots) # include hidden files

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# completion of command using most recent match in history with vim completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins "^p" up-line-or-beginning-search
bindkey -M viins "^n" down-line-or-beginning-search
bindkey -M vicmd "^p" up-line-or-beginning-search
bindkey -M vicmd "^n" down-line-or-beginning-search


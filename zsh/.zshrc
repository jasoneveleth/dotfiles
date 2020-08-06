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
autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompdump

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# The following lines were added by compinstall
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/Users/jason/.config/zsh/.zshrc'
autoload -Uz compinit
compdumpfile="$HOME/.config/zsh/.zcompcache/.zcompdump"
if [ $(uname -s) = Darwin ]; then
    one_day_old="$(date '+%s') - $(stat -f %m $compdumpfile) > 86400"
else
    one_day_old="$(date '+%s') - $(stat -c %Y "$compdumpfile") > 86400"
fi
if (( $one_day_old )); then
    compinit -d "$compdumpfile"
    touch "$compdumpfile"
    zcompile "$compdumpfile"
else
    compinit -C -d "$compdumpfile"
fi
unset compdumpfile one_day_old
_comp_options+=(globdots) # include hidden files

# https://mrigank11.github.io/2018/03/zsh-auto-completion/
_maketex() {
    _arguments '1: :($(ls *.tex))'
}
compdef _maketex maketex

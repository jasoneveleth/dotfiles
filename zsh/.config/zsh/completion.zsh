autoload -Uz compinit

_comp_options+=(globdots) # include hidden files

# https://felipec.wordpress.com/2013/07/31/how-i-fixed-git-zsh-completion/
fpath=($HOME/.config/zsh/fpath $fpath)
zstyle ':completion:*:*:git:*' script "$HOME/.config/zsh/"git-completion.bash

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

zstyle ':completion:*' menu select=long # only use menu if results go off the screen
zstyle ':completion:*' expand prefix suffix # expand as much as possible
zstyle ':completion:*' squeeze-slashes true # turn // -> /, rather than /*/

# TODO: check out if this is the same as comdump
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# https://mrigank11.github.io/2018/03/zsh-auto-completion/
_maketex() {
    _arguments '1: :($(ls *.tex))'
}
compdef _maketex maketex

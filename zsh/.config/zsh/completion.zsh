autoload -Uz compinit

_comp_options+=(globdots) # include hidden files

# https://felipec.wordpress.com/2013/07/31/how-i-fixed-git-zsh-completion/
fpath=($HOME/.config/zsh/fpath $fpath)
zstyle ':completion:*:*:git:*' script "$HOME/.config/zsh/"git-completion.zsh

## COMPDUMP ## ================================

compdumpfile="$HOME/.local/share/zsh/zcompdump"
if ! [ -e "$compdumpfile" ]; then
    # if the file doesn't exist
    mkdir -p "$(dirname $compdumpfile)" 
    refresh_compdump=true
elif [ $(uname -s) = Darwin ]; then
    # if it exists and we are on a mac, check if older than a day
    refresh_compdump="$(date '+%s') - $(stat -f %m $compdumpfile) > 86400"
else
    # if it exists and we are on linux, check if older than a day
    refresh_compdump="$(date '+%s') - $(stat -c %Y "$compdumpfile") > 86400"
fi
if (( $refresh_compdump )); then
    # make new one
    compinit -d "$compdumpfile"
    touch "$compdumpfile"
    zcompile "$compdumpfile"
else
    # read from old one
    compinit -C -d "$compdumpfile"
fi
unset compdumpfile refresh_compdump

## END COMPDUMP ## ============================

zstyle ':completion:*' menu select=long # only use menu if results go off the screen
zstyle ':completion:*' expand prefix suffix # expand as much as possible
zstyle ':completion:*' squeeze-slashes true # turn // -> /, rather than /*/

# TODO: check out if this is the same as comdump
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# https://mrigank11.github.io/2018/03/zsh-auto-completion/
_maketex() {
    # add arg 1, with text $(ls *.tex) in an array
    # format is 'num:message:array_of_things' and you can add as many as you
    # want to one _arguments call
    _arguments '1: :($(ls *.tex))'
}
compdef _maketex maketex

#!/bin/zsh

[ -f "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env" ] && . "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env"

# .fzf.zsh --- MAY NEED UPDATING
# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
# ------------- MAY NEED UPDATING

# not exported because it is bad practice to export zsh variables, only other
# program's. When a zsh variable is exported it makes it availible system-wide,
# rather than just for that session
# PS1="%{$(tput rev)%}%m%{$(tput sgr0)%} %# "
# PS1=$'%{\e[7m%}%m%{\e[0m%} %# '
PS1="%B[%m:%1~]%#%b "
# EPS1='%{%F{8}%}%~%{%f%}'
ESP1=''
RPROMPT=$EPS1

setopt interactive_comments
setopt correct
setopt autocd
setopt hist_ignore_dups appendhistory share_history
# immediately append history, rather than after terminal dies
# setopt incappendhistory

autoload -Uz compinit
compdump="$HOME/.config/zsh/.zcompcache/.zcompdump"
# {unix time} - {compdump modified date} > {seconds in a day}
if (( $(date '+%s') - $(stat -f %m $compdump) > 86400 )); then
    compinit -d $compdump
    touch $compdump
    zcompile $compdump
    echo "compiled compdump"
else
    compinit -C
fi
_comp_options+=(globdots) # include hidden files

# directory history. ex % dirs -v or % cd -<num>
export DIRSTACKSIZE=100
setopt autopushd pushdminus pushdsilent

source $ZDOTDIR/readline.zsh

alias ls="\ls -FG"
alias rm="\rm -i"
alias mv="\mv -i"
alias l="ls -lAho"

alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -x . -links +1 ! -type d -exec ls -li {} \; | rg --invert-match "Caches|(Group Containers)|(Application Support)" | sort -n'
alias battery='pmset -g batt | sed -n "s/.*[[:space:]]\([[:digit:]]*%\);.*/\1/p"'
alias noswap="rm -f $HOME/.local/share/nvim/swap/*"
alias vimrc="vi $XDG_CONFIG_HOME/nvim/init.vim"
alias zshrc="vi $XDG_CONFIG_HOME/zsh/.zshrc"
alias src="source ~/.config/zsh/.zshrc && printf 'source .zshrc'; source ~/.config/zsh/.zprofile && printf 'sourced .zprofile\n'"
alias book="vi $HOME/code/web/bookmarks/input.md"

alias shortcuts='bindkey'
alias vim='printf "use vi\n"'
alias vi="nvim"
alias jl="/usr/local/bin/julia"
alias ql="qlmanage -p 2>/dev/null"
alias brew="/usr/bin/env PATH=${PATH/$PYENV_ROOT\/shims:/} /usr/local/bin/brew" # make brew and pyenv play nice

alias com="git commit"
alias add="git add -A"
alias s="git status"

alias sb="ssh -t b 'tmux a || tmux new'"
alias mb="/Applications/Tunnelblick.app/Contents/MacOS/Tunnelblick > /dev/null 2>&1 &; mosh --no-init --experimental-remote-ip=remote b /home/jeveleth/bin/special-tmux; killall Tunnelblick;"

# FUNCTIONS
# nnn
n() {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" (as in don't export is,
    # this is current functionality
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

vis() {
    string='s/background_opacity:.*$/background_opacity: '
    string+=$1
    string+='/'
    sed -i '' -e $string $XDG_CONFIG_HOME/alacritty/alacritty.yml
}

zathura() {
    /usr/local/bin/zathura "$@" > /dev/null 2>&1 &
}

text() {
    command="tell application \"Messages\" to send \"${1:-hey sexy}\" to buddy \"${2:-Anna ❤️ Lee}\""
    osascript -e "$command"
}

acp() {
    git add --update
    git commit -m "$@"
    git push
}

# https://mrigank11.github.io/2018/03/zsh-auto-completion/
_maketex() {
    local state 
    _arguments '1: :($(ls *.tex))'
}
compdef _maketex maketex

# get direnv, and pyenv working, takes 0.06 seconds
eval "$(direnv hook zsh)"
eval "$(pyenv init - zsh --no-rehash)"
eval "$(jump shell)"

#!/bin/sh

# this keeps tmux from messing with path variable
if [ -f /etc/profile ]; then
    PATH=""
    . /etc/profile
fi

export PATH="$HOME/bin:/usr/local/sbin:$HOME/Library/Python/3.8/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH:."
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export PYLINTHOME="$XDG_CONFIG_HOME/python/pylint.d"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal"
export IDLESTARTUP="$XDG_CONFIG_HOME/python/idlerc"
export ICLOUD="/Users/jasoneveleth/Library/Mobile Documents/com~apple~CloudDocs"
export LESSHISTFILE="$HOME/.cache/less/histfile"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export GEM_HOME="$XDG_CONFIG_HOME/gem/ruby/2.7.0"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export VISUAL="nvim"
export EDITOR="nvim"
export HOMEBREW_NO_AUTO_UPDATE=1

# ALIASES
alias directoryPrompt="PS1=\"[%~]\"$'\n'\" $ \""
alias oldPrompt="PS1='%{%K{0}%F{255}%}%m%{%f%k%} %~ $ '"
alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias ls="\ls -FG"
alias l="ls -lAh"
alias path='echo $PATH | tr -s ":" "\n"'
alias empty="echo '' >"
alias dh='dirs -v'
alias findhardlinks='find -x . -links +1 ! -type d -exec ls -li {} \; | rg --invert-match "Caches|(Group Containers)|(Application Support)" | sort -n'
alias battery='pmset -g batt | sed -n "s/.*[[:space:]]\([[:digit:]]*%\);.*/\1/p"'

alias py="/usr/local/bin/python3.8"
alias v="nvim"
alias vim="nvim"

alias nist="cd $HOME/code/python/nistsurf"
alias bump="cd $HOME/Dropbox/bump"
alias note="cd $HOME/notes"

alias com="git commit"
alias add="git add -A"

alias n="cd $HOME/notes; vim \`fzf\`; cd;"
alias vimrc="v $XDG_CONFIG_HOME/nvim/init.vim"
alias zprofile="v $XDG_CONFIG_HOME/zsh/.zprofile"
alias zshrc="v $XDG_CONFIG_HOME/zsh/.zshrc"
alias book="v $HOME/code/web/bookmarks/input.md"

alias ta="tmux a -t"
alias stbrown="ssh -t b 'tmux a'"
alias tbrown="mosh --no-init --experimental-remote-ip=remote b tmux a || echo '\n\nMUST USE Tunnelblick and activate browns vpn'"

# FUNCTIONS
function vis() {
    string='s/background_opacity:.*$/background_opacity: '
    string+=$1
    string+='/'
    sed -i '' -e $string $XDG_CONFIG_HOME/alacritty/alacritty.yml
}

function ql() {
    qlmanage -p "$@" 2>/dev/null
}

function text() {
    command="tell application \"Messages\" to send \"${1:-hey sexy}\" to buddy \"${2:-Anna ❤️ Lee}\""
    osascript -e "$command"
}

function maketex() {
    mkdir -p ./tex-stuff
    echo "compiling..."
    if pdflatex -output-directory=./tex-stuff -halt-on-error ${1:-main.tex} 1> /dev/null; then
        echo "moving pdfs..."
        cp -f ./tex-stuff/*.pdf .
        echo "done!"

    else 
        echo "FUCK"
        pdflatex -output-directory=./tex-stuff -halt-on-error ${1:-main.tex}

    fi
}

function printcolors() {
    for i in {1..256}; do print -P "%F{$i}Color : $i"; done;
}

# seach history
fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

function acp() {
git add -A
git commit -m "$@"
git push
}

function randomText() {
text=''
for ((i = 0; i < $1; i++));do
    if [[ $(($RANDOM % 10)) < 2 ]];then
        text+=' '
        i+=1
    fi
    text+=$((number = $RANDOM % 10))
done
echo $text
}


#!/bin/sh

# this keeps tmux from messing with path variable
if [ -f /etc/profile ]; then
    PATH=""
    . /etc/profile
fi

export PATH="$HOME/bin:$HOME/Library/Python/3.8/bin:$PATH:."
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
export EDITOR="nvim"
export HOMEBREW_NO_AUTO_UPDATE=1



alias v="nvim"
alias vim="nvim"
alias ta="tmux a -t"
alias directoryPrompt="PS1=\"[%~]\"$'\n'\" $ \""
alias oldPrompt="PS1='%{%K{0}%F{255}%}%m%{%f%k%} %~ $ '"
alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias ctags="/usr/local/bin/ctags"
alias py="/usr/local/bin/python3.8"
alias ls="\ls -FG"
alias l="ls -lAh"
alias grep="grep --color=auto"
alias path='echo $PATH | tr -s ":" "\n"'
alias ql="qlmanage -p"
alias empty="echo '' >"
alias dh='dirs -v'

alias commit="git commit"
alias add="git add -A"

# quick edit stuff
alias vimrc="v $XDG_CONFIG_HOME/nvim/init.vim"
alias zshrc="v $XDG_CONFIG_HOME/zsh/.zshrc"
alias book="v $HOME/code/web/bookmarks/input.md"

# quick tmux
alias nist="cd $HOME/code/python/nistsurf"
alias bump="cd $HOME/Dropbox/bump/"
alias tnist="tmux a -t nist"
alias tbump="tmux a -t bump"
alias tbrown="ssh jeveleth@ssh.cs.brown.edu -t tmux new"



function vis() {
    string='s/background_opacity:.*$/background_opacity: '
    string+=$1
    string+='/'
    sed -i '' -e $string $XDG_CONFIG_HOME/alacritty/alacritty.yml
}

function text() {
    command="tell application \"Messages\" to send \"${1:-hey sexy}\" to buddy \"${2:-Anna ❤️ Lee}\""
    osascript -e "$command"
}

function maketex() {
    echo "Press ^D if it hangs, and run: \n\n% pdflatex <file> \n"
    mkdir -p ./tex-stuff
    pdflatex -output-directory=./tex-stuff ${1:-main.tex} >/dev/null
    cp -f ./tex-stuff/*.pdf ./output.pdf
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


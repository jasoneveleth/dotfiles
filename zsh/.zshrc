#!/bin/zsh

[ -f "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env" ] && . "${GHCUP_INSTALL_BASE_PREFIX:="$HOME"}/.ghcup/env"

# not exported because it is bad practice to export zsh variables, only other
# program's. When a zsh variable is exported it makes it availible system-wide,
# rather than just for that session
PS1=$'%{\e[7m%}%m%{\e[0m%} %# '
# PS1="%{$(tput rev)%}%m%{$(tput sgr0)%} %# "
RPROMPT='%{%F{8}%}%~%{%f%}'

setopt hist_ignore_space
setopt hist_ignore_dups
setopt interactive_comments
setopt share_history
setopt correct
setopt autocd

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

# directory history. ex % dirs -v % cd -<num>
export DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# enter vi mode
KEYTIMEOUT=1
bindkey -v
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# completion of command using most recent match in history with vim completion
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search

################## ALIASES #####################
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

alias v="nvim"
alias vim="nvim"

alias nist="runpythonenv; cd $HOME/code/python/nistsurf"
alias bump="cd $HOME/Dropbox/bump"
alias note="cd $HOME/notes"

alias com="git commit"
alias add="git add -A"
alias s="git status"

alias n="cd $HOME/notes; vim \`fzf\`; cd;"
alias vimrc="v $XDG_CONFIG_HOME/nvim/init.vim"
alias zshrc="v $XDG_CONFIG_HOME/zsh/.zshrc"
alias book="v $HOME/code/web/bookmarks/input.md"

alias ta="tmux a -t"
alias stbrown="ssh -t b 'tmux a'"
alias tbrown="mosh --no-init --experimental-remote-ip=remote b tmux a || echo '\n\nMUST Use Tunnelblick and activate browns vpn'"

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

function runpythonenv() {
    # get direnv, and pyenv working, takes 0.06 seconds
    eval "$(direnv hook zsh)"
    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init - zsh --no-rehash)"
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

# function randomText() {
# _temp=''
# for ((i = 0; i < $1; i++));do
#     if [[ $(($RANDOM % 10)) < 2 ]];then
#         _temp+=' '
#         i+=1
#     fi
#     _temp+=$(($RANDOM % 10))
# done
# echo $_temp
# }

################### DONE WITH ALIASES #######################

# attach to "general" tmux session or makes one
if command -v tmux 1> /dev/null 2>&1 && [ -z "$TMUX" ]; then
    tmux attach -t general 2>/dev/null || tmux new -s general
fi


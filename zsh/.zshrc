#!/bin/zsh

# ------------- fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# ------------- general
PS1="%B[%m:%1~]%#%b "

setopt interactive_comments
setopt hist_ignore_dups appendhistory share_history

# directory history. ex % dirs -v or % cd -<num>
export DIRSTACKSIZE=100
setopt autopushd pushdminus pushdsilent

source $ZDOTDIR/readline.zsh

# ------------- completion
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

# https://mrigank11.github.io/2018/03/zsh-auto-completion/
_maketex() {
    local state 
    _arguments '1: :($(ls *.tex))'
}
compdef _maketex maketex

# ------------- aliases
alias ls="\ls -FG"
alias rm="\rm -i"
alias mv="\mv -i"

alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -x . -links +1 ! -type d ! -regex "Caches|(Group Containers)|(Application Support)" -exec ls -l {} \; 2> /dev/null | sort -nk2'
alias battery="pmset -g batt | egrep -o '\d+%'"
alias noswap="rm -f $HOME/.local/share/nvim/swap/*"
alias vimrc="vi $XDG_CONFIG_HOME/nvim/init.vim"
alias zshrc="vi $XDG_CONFIG_HOME/zsh/.zshrc"
alias src="source ~/.config/zsh/.zshrc && printf 'source .zshrc'; source ~/.config/zsh/.zprofile && printf 'sourced .zprofile\n'"
alias book="vi $HOME/code/web/bookmarks/input.md"
alias ..='cd ..'
alias ...='cd ../..'

alias oni="oni2"
alias vi="nvim"
alias g='git'
alias jl="julia"
alias ql="qlmanage -p 2>/dev/null"
alias less="bat"
alias cat="bat"

alias sb="ssh -t b 'tmux a || tmux new'"
alias mb="open -a Tunnelblick; mosh --no-init --experimental-remote-ip=remote b /home/jeveleth/bin/special-tmux; killall Tunnelblick;"

# ------------- functions
n() {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # To cd on quit only on ^G, remove the "export" (like what it is now)
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

# ------------- hooks (time wasters)
eval "$(direnv hook zsh)"
eval "$(pyenv init - zsh --no-rehash)"
eval "$(jump shell)"

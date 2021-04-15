#!/bin/zsh

# ------------- fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# ------------- make like fish
# https://github.com/zsh-users/zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ------------- general
PS1="[%m:%1~]%# "

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
alias ls="/bin/ls -G"
alias ll="ls -l"
alias la="ls -Al"
alias rm='printf "idiot no. use ls first, then /bin/rm if you really want.\notherwise just \`trash\`\n"'

alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -E . -links +1 \! -type d \! -regex "\./Library/.*" -exec ls -l {} \; 2> /dev/null | sort -nk2'
alias battery="pmset -g batt | egrep -o '\d+%'"
alias noswap="rm -f $HOME/.local/share/nvim/swap/*"
alias ..='cd ..'
alias ...='cd ../..'

alias oni="oni2"
alias vi="nvim"
alias g='git'
alias jl="julia"
alias ql="qlmanage -p 2>/dev/null"
alias less="bat"
alias cat="bat"
alias n="nnn"
alias moshr="mosh --no-init --experimental-remote-ip=remote"

# ------------- hooks (time wasters)
eval "$(direnv hook zsh)"
eval "$(jump shell)"
source "$XDG_CONFIG_HOME"/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

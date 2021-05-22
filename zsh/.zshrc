#!/bin/zsh

# ------------- fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# ------------- general
PS1="[%m:%1~]%# "

# https://github.com/zsh-users/zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt interactive_comments
setopt inc_append_history
# ^ maybe remove 'inc_' so it only adds once session exits
setopt hist_ignore_all_dups

# directory history. ex % dirs -v or % cd -<num>
export DIRSTACKSIZE=100
setopt autopushd pushdminus pushdsilent

source $ZDOTDIR/readline.zsh

# ------------- completion
# The following lines were added by compinstall
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/Users/jason/.config/zsh/.zshrc'
autoload -Uz compinit
compdumpfile="$HOME/.config/zsh/.zcompcache/.zcompdump"
# {unix time} - {compdumpfile modified date} > {seconds in a day}
if (( $(date '+%s') - $(stat -f %m "$compdumpfile") > 86400 )); then
    compinit -d "$compdumpfile"
    touch "$compdumpfile"
    zcompile "$compdumpfile"
else
    compinit -C -d "$compdumpfile"
fi
unset compdumpfile
_comp_options+=(globdots) # include hidden files

# https://mrigank11.github.io/2018/03/zsh-auto-completion/
_maketex() {
    local state 
    _arguments '1: :($(ls *.tex))'
}
compdef _maketex maketex

# ------------- aliases
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias rm='printf "idiot no. use ls first, then /bin/rm if you really want.\notherwise just \`trash\`\n"'

alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -E . -links +1 \! -type d \! -regex "\./Library/.*" -exec ls -l {} \; 2> /dev/null | sort -nk2'
alias battery="pmset -g batt | egrep -o '\d+%'"
alias noswap="rm -f $HOME/.local/share/nvim/swap/*"
alias src='source $HOME/.config/zsh/.zshrc && source $HOME/.config/zsh/.zshenv'
alias j='cd $(quick) && pwd'
alias ..='cd ..'
alias ...='cd ../..'

alias python='[ -e ./.env/bin/activate ] && [ -z ${VIRTUAL_ENV+x} ] && echo sourced && . ./.env/bin/activate; python'
alias d='deactivate'
alias oni="oni2"
alias vi="nvim"
alias ql="qlmanage -p 2>/dev/null"
alias less="bat"
alias cat="bat"
alias n="nnn"

alias gs="git status"
alias ga="git add"
alias gA="git add -A"
alias gss="git status -s"
alias gap="git add -p"
alias gac="git add -A && git commit --verbose"
alias gc="git commit --verbose"
alias gacp="git add -A && git commit --verbose && git push"
alias gp="git push"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log -n 30 --graph --abbrev-commit --all --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset %C(yellow)%d%Creset %s'"
alias galias="grep 'alias g' $HOME/.config/zsh/.zshrc | cut -d' ' -f2-"

source "$XDG_CONFIG_HOME"/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


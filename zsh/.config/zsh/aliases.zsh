alias ls="exa -s type"
alias ll="exa -l -s type"
alias la="exa -l -a -s type"
alias grep="grep --color=auto"
alias rm='echo "this is not the command you are looking for. use: \`trash\`\n"; false'
alias trash='trash -F'
alias cp='cp -i'

alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -E . -links +1 \! -type d \! -regex "\./Library/.*" -exec ls -l {} \; 2> /dev/null | sort -nk2'
# zsh only
alias brokensymlinks='trash -- *(-@D)'
alias battery="pmset -g batt | egrep -o '\d+%'"
alias noswap="trash $HOME/.local/share/nvim/swap/*"
alias src='source $HOME/.config/zsh/.zshrc && source $HOME/.config/zsh/.zshenv'
alias ..='builtin cd ..'
alias ...='builtin cd ../..'

alias adobe='kill -9 $(pgrep -f Adobe) $(pgrep -f CoreSync)'
alias nist='date >> $NIST_JOURNAL; $EDITOR -c "norm! Go" $NIST_JOURNAL'
alias os='diskutil unmount force /tmp/brown ; sshfs brown:/gpfs/main/home/jeveleth/course/cs1690 /tmp/brown && echo Mount successful && cd $PWD'
# (r)un (n)ext
alias rn=' eval "$(zsh_history_next)"'
proj() {cd "$(sd misc proj $@)" && pwd}
i() {printf "%s@%s in %s\n" "$USER" `hostname` "$PWD"}
# TODO add conda env, and git status

alias notes='source $(which -p notes)'
alias oni="oni2"
alias maple="/Library/Frameworks/Maple.framework/Versions/2020/bin/maple"
alias ql="qlmanage -p 2>/dev/null"
alias sc="shellcheck"
alias less="bat"
n() {nnn "$@" && test -e "$HOME/.config/nnn/.lastd" && . "$HOME/.config/nnn/.lastd" && /bin/rm -f "$HOME/.config/nnn/.lastd" > /dev/null}
alias icat="kitty +kitten icat --align=left"
alias isvg="rsvg-convert | icat"
alias idot="dot -Tsvg \
    -Gbgcolor=transparent \
    -Gcolor=#abb2bf \
    -Gfontcolor=#abb2bf \
    -Gfontname=Hack \
    -Grankdir=LR \
    -Nfontname=Hack \
    -Nfontcolor=#abb2bf \
    -Ncolor=#abb2bf \
    -Efontcolor=#abb2bf \
    -Efontname=Hack \
    -Ecolor=#abb2bf | isvg"
alias dvisvgm-pipe='dvisvgm --verbosity=0 --stdin --stdout --no-fonts --libgs=\"/opt/homebrew/lib/libgs.dylib\" 2>/dev/null'
alias itex="(cat \"$HOME/.local/share/misc/header.tex\" -; echo '\\\\end{document}') | latex-pipe | idvi"
alias idvi="dvisvgm-pipe | sed \"s/<path /& fill='#abb2bf' /g\" | rsvg-convert -d 300 -p 300 2> /dev/null | icat 2>/dev/null"

alias e="$EDITOR"
alias vs="nvr --remote-wait -O"
alias sp="nvr --remote-wait -o"

# https://github.com/garybernhardt/dotfiles/blob/004164079c6aeb226338b5a1b5d4f91f366ff50e/.zshrc#L69
function up()
{
    local DIR=$PWD
    local TARGET=$1
    while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
        DIR=$(dirname $DIR)
    done
    test $DIR != "/" && echo $DIR/$TARGET
}

# alias git='echo nope! use \`jg\`'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gdh='git diff HEAD'
alias gd='git diff'
alias gdc='git diff --cached'
alias gci='git commit'
alias gcm='git commit -m'
alias gca='git add --update && git commit'
alias gco='git checkout'
alias gl='git log --oneline --graph --all'
alias gps='git push'
alias gpl='git pull'


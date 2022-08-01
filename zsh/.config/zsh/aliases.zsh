alias ls="exa -s type"
alias ll="exa -l -s type"
alias la="exa -l -a -s type"
alias grep="grep --color=auto"
alias rm='printf "this is not the command you are looking for. use: \`trash\`\n"; false'
alias cp='cp -i'

alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -E . -links +1 \! -type d \! -regex "\./Library/.*" -exec ls -l {} \; 2> /dev/null | sort -nk2'
alias battery="pmset -g batt | egrep -o '\d+%'"
alias noswap="trash $HOME/.local/share/nvim/swap/*"
alias src='source $HOME/.config/zsh/.zshrc && source $HOME/.config/zsh/.zshenv'
alias ..='builtin cd ..'
alias ...='builtin cd ../..'

alias nist='date >> $NIST_JOURNAL; $EDITOR -c "norm! Go" $NIST_JOURNAL'
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
alias itex="(cat \"$HOME/.local/share/misc/header.tex\" -; echo '\\\\end{document}') | sd tex latex-pipe | idvi"
alias idvi="dvisvgm-pipe | sed \"s/<path /& fill='#abb2bf' /g\" | rsvg-convert -d 300 -p 300 2> /dev/null | icat 2>/dev/null"

alias e="$EDITOR"
alias vs="nvr --remote-wait -O"
alias sp="nvr --remote-wait -o"

find_tag() {
    tag="$1"
    cmd="$2"
    shift
    shift
    for n in "$@"; do
        eval has_tag "$n" "$tag" "$cmd"
    done
    return 0
}

has_tag() {
    # yaml for *.md
    if [[ "$1" == *.md ]]; then
        matches=`cat "$1" | extract -v pattern=tags`
        # split up avoid covering up an error earlier in the pipe
        echo $matches | rg -q "$2" && return 0
        return 1
    fi

    # .tag for a directory
    if [ -d "$1" ]; then
        # if files doesn't exist exit
        [ ! -e "$1"/.tags ] && return 1

        cat "$1"/.tags | rg -q "$2" && return 0
    fi
    return 1
}

# alias git='echo nope! use \`jg\`'
alias gs='git status'
alias gd='echo jdf'

alias jci='jg commit'
alias jca='jg stage --tracked && jg commit'
alias jdf='jg diff'
alias jco='jg checkout'
alias jvh='jg view-history'
alias jps='jg push'
alias jpl='jg pull'

# ========= CONDA ===========
alias cde='conda deactivate'
alias cac='conda activate'


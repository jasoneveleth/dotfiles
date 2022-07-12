alias ls="exa -s type"
alias ll="exa -l -s type"
alias la="exa -la -s type"
alias grep="grep --color=auto"
alias rm='printf "this is not the command you are looking for. use: \`trash\`\n"; false'
alias cp='cp -i'

alias cleanDS="find . -name '*.DS_Store' -type f -delete"
alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -E . -links +1 \! -type d \! -regex "\./Library/.*" -exec ls -l {} \; 2> /dev/null | sort -nk2'
alias battery="pmset -g batt | egrep -o '\d+%'"
alias noswap="trash $HOME/.local/share/nvim/swap/*"
alias src='source $HOME/.config/zsh/.zshrc && source $HOME/.config/zsh/.zshenv'
alias j='cd $(quick)'
alias so='source'
alias ..='cd ..'
alias ...='cd ../..'

alias nist='date >> $NIST_JOURNAL; $EDITOR -c "norm! Go" $NIST_JOURNAL'
proj() {
    TMPDIR=`sd misc proj "$@"`
    cd "$TMPDIR"
}
alias n=' eval "$(zsh_history_next)"'
alias notes='source $(which -p notes)'
alias oni="oni2"
alias maple="/Library/Frameworks/Maple.framework/Versions/2020/bin/maple"
alias ql="qlmanage -p 2>/dev/null"
alias sc="shellcheck"
alias less="bat"
alias nnn='nnn && test -e "$HOME/.config/nnn/.lastd" && . "$HOME/.config/nnn/.lastd" && /bin/rm -f "$HOME/.config/nnn/.lastd" > /dev/null'
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
alias dvisvgm-pipe='dvisvgm --verbosity=0 --stdin --stdout --no-fonts --libgs=\"/opt/homebrew/lib/libgs.dylib\" 2> /dev/null'
alias itex="(cat $HOME/.local/share/misc/header.tex; cat -; echo '\\\\end{document}') | sd tex latex-pipe | idvi"
alias idvi="dvisvgm-pipe | \
            sed \"s/<path /& fill='#abb2bf' /g\" | \
            rsvg-convert -d 300 -p 300 | \
            icat"

alias e="$EDITOR"
alias vs="nvr --remote-wait -O"
alias sp="nvr --remote-wait -o"

alias m='make'
alias mc='make clean'
alias mca='make clean all'
alias mr='make run'
alias mt='make test'
alias mct='make clean test'
alias mcr='make clean run'

#======================= GIT ===============================#
alias gs="git status"
alias gss="git status -s"

alias ga="git add"
alias gaa="git add -A"
alias gap="git add -p"

alias gc="git commit --verbose"
alias gca="git add -A && git commit --verbose"
alias gcu="git add -u && git commit --verbose"
alias gpa="git add -A && git commit --verbose && git push"

alias gp="git push"
alias gr="git rebase"
alias gco="git checkout"
alias gam="git amend"
# alias gconflict="git diff --name-only --diff-filter=U"

alias gd="git diff HEAD"
alias gds="git diff --cached" # staged
alias gdu="git diff"          # unstaged

alias gl="git log --all --oneline --graph"
alias glt="git log -n 30 --abbrev-commit --all --pretty=format:'%C(auto)%h %Cgreen(%cr)%C(auto)%d %s'"
alias gla="git log -n 30 --graph --abbrev-commit --all --pretty=format:'%C(yellow)%h %Cgreen(%cr) %C(bold blue)<%an>%C(auto)%d%Creset %s'"

alias galias="grep 'alias g' $HOME/.config/zsh/aliases.zsh | cut -d' ' -f2-"
#======================= END GIT ===============================#

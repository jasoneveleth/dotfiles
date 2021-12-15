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
# alias act='[ -e ./.env/bin/activate ] && [ -z ${VIRTUAL_ENV+x} ] && echo sourced && . ./.env/bin/activate'
alias d='deactivate'
alias a='source ~/.root/dev/python/venv/bin/activate'
alias cs="source ~/cs1410/cs1410_env/bin/activate"
alias oni="oni2"
alias ql="qlmanage -p 2>/dev/null"
alias less="bat"
alias n="nnn"
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

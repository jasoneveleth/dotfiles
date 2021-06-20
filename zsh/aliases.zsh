alias ls="exa -s type"
alias ll="exa -l -s type"
alias la="exa -la -s type"
alias rm='printf "idiot no. use ls first, then /bin/rm if you really want.\notherwise just \`trash\`\n"'

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

alias act='[ -e ./.env/bin/activate ] && [ -z ${VIRTUAL_ENV+x} ] && echo sourced && . ./.env/bin/activate'
alias d='deactivate'
alias python='act; python'
alias oni="oni2"
alias ql="qlmanage -p 2>/dev/null"
alias less="bat"
alias cat="bat"
alias n="nnn"

alias m='make'
alias mc='make clean'
alias mr='make run'
alias mt='make test'
alias mct='make clean test'
alias mcr='make clean run'

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
alias gla="git log -n 30 --graph --abbrev-commit --all --pretty=format:'%C(yellow)%h %Cgreen(%cr) %C(bold blue)<%an>%C(auto)%d%Creset %s'"
alias glt="git log -n 30 --abbrev-commit --all --pretty=format:'%C(auto)%h %Cgreen(%cr)%C(auto)%d %s'"
alias gl="git log -n 16 --all --oneline"
alias glg="git log --all --oneline"
alias galias="grep 'alias g' $HOME/.config/zsh/.zshrc | cut -d' ' -f2-"

alias grep="grep --color=auto"
alias rm='echo "this is not the command you are looking for. use: \`trash\`\n"; false'
trash() {
	TRASHDIR="$HOME/mytrash"
	mkdir "$TRASHDIR" 2> /dev/null
	while [ "$1" != "" ]; do
		if ! mv -i "$1" "$TRASHDIR"; then
			mv "$1-$(date +%s)" "$TRASHDIR"
		fi
		shift
	done
}
alias cp='cp -i'

alias path='echo $PATH | tr -s ":" "\n"'
alias findhardlinks='find -E . -links +1 \! -type d \! -regex "\./Library/.*" -exec ls -l {} \; 2> /dev/null | sort -nk2'
alias noswap="trash $HOME/.local/share/nvim/swap/*"
alias ..='builtin cd ..'
alias ...='builtin cd ../..'

alias e="$EDITOR"

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gl='git log --oneline --graph --all'
alias gps='git push'
alias gpl='git pull'

alias gdh='git diff HEAD'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdp='git diff HEAD^ HEAD'

alias gci='git commit'
alias gcm='git commit -m'
alias gca='git add --update && git commit'
alias gco='git checkout'
alias galias="cat ~/.config/zsh/aliases.zsh | grep '^alias g'"


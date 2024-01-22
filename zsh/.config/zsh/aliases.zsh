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
alias itex="(cat \"$HOME/.local/share/misc/header.tex\" -; echo '\\\\end{document}') | pwrap pdflatex -interaction batchmode -halt-on-error file.tex tex pdf | convert -density 300 pdf:- png:- | icat"
alias itikz="latex-pipe2 | convert -density 300 pdf:- png:- | icat"
alias idvi="dvisvgm-pipe | sed \"s/<path /& fill='#abb2bf' /g\" | rsvg-convert -d 300 -p 300 2> /dev/null | icat 2>/dev/null"

alias e="$EDITOR"
alias vs="nvr --remote-wait -O"
alias sp="nvr --remote-wait -o"

chpwd_functions+=(check_dir_for_conda_activate)

check_dir_for_conda_activate() {
    dir="$PWD"
    if [ "${dir%/src/baysian-methods}" != "$dir" ] || \
        [ "${dir%/src/water-drop}" != "$dir" ] || \
        [ "${dir%/src/qr-code}" != "$dir" ] || \
        [ "${dir%/src/python_exceptions}" != "$dir" ] || \
        [ "${dir%/src/python-misc}" != "$dir" ] || \
        [ "${dir%/src/python-c-extension}" != "$dir" ] || \
        [ "${dir%/src/wordle}" != "$dir" ] || \
        [ "${dir%/src/autograd}" != "$dir" ] || \
        [ "${dir%/src/wordsquare}" != "$dir" ] || \
        [ "${dir%/src/wyag}" != "$dir" ] || \
        [ "${dir%/src/jupyter-notebooks}" != "$dir" ] || \
        [ "${dir%/src/sage}" != "$dir" ]; then
        echo '`jason-conda` if you want'
    elif [ "${dir%/src/hdcms-c}" != "$dir" ] || \
        [ "${dir%/src/hdcms-python-bindings}" != "$dir" ] || \
        [ "${dir%/src/hdcms-python}" != "$dir" ]; then
        jason-conda-no-default
        conda activate hdcms-dev
    elif [ "${dir%/src/lab_to_rgb}" != "$dir" ]; then
        echo 'activating tensorflow...'
        jason-conda-no-default
        conda activate tensorflow
    elif [ "${dir%/src/jax}" != "$dir" ]; then
        jason-conda-no-default
        conda activate jax-metal
    fi
        # pytorch
        # manim
}

# note: it's not strictly necessary to unset this, since once conda is initialized,
# like in `jason-conda`, conda will unset it itself
conda() {
    unset -f conda
    jason-conda
    conda "$@"
}

jason-conda() {
    jason-conda-no-default
    conda activate default
    echo 'deactivate if you want `base`'
    jason-conda() {echo 'jason>> conda is set up'}
}

# will make itself do nothing
jason-conda-no-default() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/jason/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/jason/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/Users/jason/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/jason/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    echo 'jason>> conda set up'
    jason-conda-no-default() {echo 'jason>> conda is set up'}
}

# alias git='echo nope! use \`jg\`'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
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


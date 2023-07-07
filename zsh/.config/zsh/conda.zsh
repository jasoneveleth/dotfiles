activate_my_conda() {
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
}

choose_env() {
    conda env list
    trap "echo hi; trap - INT; return 1" INT
    vared -p 'choose env (leave blank for base): ' -c env
    conda activate "$env"
}

python() {
    OLD_PS1="$PS1"
    if ! activate_my_conda; then
        return
    fi
    activate_my_conda() {true}

    # only unset this stuff if we choose an env correctly
    if choose_env; then
        unset -f activate_my_conda
        unset -f choose_env
        unset -f python
        python "$@"
    else
        PS1="$OLD_PS1"
    fi
}


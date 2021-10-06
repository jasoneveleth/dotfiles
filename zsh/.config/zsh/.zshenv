#!/bin/zsh

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

BASEPATH="$BASEPATH"
if [ "$BASEPATH" = "" ]; then
    export BASEPATH="$PATH"
fi
export PATH="$HOME/.local/bin:/usr/local/bin:/Applications/Racket v8.2/bin:$HOME/.elan/bin:$BASEPATH:."
if [ "$(uname)" = "Darwin" ]; then
    PATH="$PATH:/Library/TeX/texbin:/usr/local/opt/llvm/bin/"
fi

export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="/tmp/npm"
export npm_config_devdir="$XDG_DATA_HOME"/node-gyp
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYTHONHISTFILE="$HOME/.local/share/python/history"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export PYLINTHOME="$XDG_CONFIG_HOME/python/pylint.d"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal"
export IDLESTARTUP="$XDG_CONFIG_HOME/python/idlerc"
export LESSHISTFILE="$HOME/.cache/less/histfile"
export JUMP_HOME="$XDG_CONFIG_HOME/jump"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export GEM_HOME="$XDG_CONFIG_HOME/gem/ruby/2.7.0"
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"
export JUMP_HOME="$XDG_CONFIG_HOME/jump"
export KERAS_HOME="$XDG_CONFIG_HOME"/keras
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

export BIBINPUTS="$XDG_CONFIG_HOME/latex"  
export BAT_THEME='TwoDark'
export KEYTIMEOUT=1
export JULIA_NUM_THREADS=4
export NTHREADS=4
export JULIA_DEPOT_PATH="$XDG_CONFIG_HOME/julia"
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --exclude node_modules --exclude __pycache__ --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PYTHONDONTWRITEBYTECODE=1
export HOMEBREW_NO_AUTO_UPDATE=1
# export VIMINIT= 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export NNN_BMS='o:~/notes;c:~/.config;v:~/.config/nvim;1:~/cs1951X;2:~/math1260;3:~/cs1730;4:~/cs1410;'
# export NNN_PLUG='e:-_ewrap $nnn*;n:-_fzfnotes*;v:-_nvim*'
export NNN_PLUG='n:-!fzfnotes*;v:-!nvim*;'
export NNN_COLORS="4512"
export PAGER="bat"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export JOURNAL="$HOME/.root/personal/journal.md"
export NIST_JOURNAL="$HOME/.root/misc/sem05/nist_prep/journal.md"
export EXA_COLORS="*.pdf=35:*.wav=36:*.png=35:*.c=01:*.py=01"

export CPATH="$HOME/dev/c/include/"

setopt no_global_rcs

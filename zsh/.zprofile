#!/bin/zsh

# this keeps tmux from messing with path variable
if [ -f /etc/profile ]; then
    PATH=""
    . /etc/profile
fi

HISTSIZE=1000000
SAVEHIST=10000000

export PATH="$HOME/bin:~/.pyenv/bin:/usr/local/sbin:/usr/local/opt/openjdk/bin:$HOME/Library/Python/3.8/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH:."
export ICLOUD="/Users/jasoneveleth/Library/Mobile Documents/com~apple~CloudDocs"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYTHONHISTFILE="$HOME/.local/share/python/history"
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export PYLINTHOME="$XDG_CONFIG_HOME/python/pylint.d"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal"
export IDLESTARTUP="$XDG_CONFIG_HOME/python/idlerc"
export LESSHISTFILE="$HOME/.cache/less/histfile"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export GEM_HOME="$XDG_CONFIG_HOME/gem/ruby/2.7.0"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"
export BIBINPUTS="$HOME/.config/latex"  
export npm_config_devdir="$XDG_DATA_HOME"/node-gyp

export KEYTIMEOUT=1
export JULIA_NUM_THREADS=4
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --exclude node_modules --exclude __pycache__'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PYTHONDONTWRITEBYTECODE=1
export HOMEBREW_NO_AUTO_UPDATE=1
export NNN_BMS='n:~/notes;i:~/code/python/nistsurf;z:~/.config/zsh;v:~/.config/nvim;c:~/code/c;d:~/.config'
export NNN_PLUG='e:-_ewrap $nnn*;n:-_fzfnotes*;v:-_nvim*'
export NNN_OPTS="en"
export NNN_COLORS="4512"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export JOURNAL="$HOME/personal/journal.md"

# export VIMINIT= 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# to fix pyenv
export LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib"

# export LANG="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

#!/bin/zsh

export PATH_FIXED=1

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.local/bin:$XDG_CONFIG_HOME/pyenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Apple/usr/bin:/usr/local/opt/fzf/bin:."
# export PATH="$HOME/.local/bin:$XDG_CONFIG_HOME/pyenv/shims:$PATH:."
export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYTHONHISTFILE="$HOME/.local/share/python/history"
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export PYLINTHOME="$XDG_CONFIG_HOME/python/pylint.d"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal"
export IDLESTARTUP="$XDG_CONFIG_HOME/python/idlerc"
export LESSHISTFILE="$HOME/.cache/less/histfile"
export JUMP_HOME="$XDG_CONFIG_HOME/jump"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export GEM_HOME="$XDG_CONFIG_HOME/gem/ruby/2.7.0"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"
export npm_config_devdir="$XDG_DATA_HOME"/node-gyp
export JUMP_HOME="$XDG_CONFIG_HOME/jump"
export KERAS_HOME="$XDG_CONFIG_HOME"/keras
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

export BIBINPUTS="$XDG_CONFIG_HOME/latex"  
export KEYTIMEOUT=1
export JULIA_NUM_THREADS=4
export JULIA_DEPOT_PATH="$XDG_CONFIG_HOME/julia"
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --exclude node_modules --exclude __pycache__'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PYTHONDONTWRITEBYTECODE=1
export HOMEBREW_NO_AUTO_UPDATE=1
# export VIMINIT= 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export NNN_BMS='n:~/notes;i:~/code/python/nistsurf;z:~/.config/zsh;v:~/.config/nvim;c:~/code/c;d:~/.config'
export NNN_PLUG='e:-_ewrap $nnn*;n:-_fzfnotes*;v:-_nvim*'
export NNN_OPTS="e"
export NNN_COLORS="4512"
export PAGER="less"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export JOURNAL="$HOME/.root/personal/journal.md"

# to fix pyenv
export LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib"


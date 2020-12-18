#!/bin/zsh

# this keeps tmux from messing with path variable
if [ -f /etc/profile ]; then
    PATH=""
    . /etc/profile
fi

export PATH="$HOME/bin:~/.pyenv/bin:/usr/local/sbin:$HOME/Library/Python/3.8/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH:."
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export PYTHONDONTWRITEBYTECODE=1
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export PYLINTHOME="$XDG_CONFIG_HOME/python/pylint.d"
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal"
export IDLESTARTUP="$XDG_CONFIG_HOME/python/idlerc"
export ICLOUD="/Users/jasoneveleth/Library/Mobile Documents/com~apple~CloudDocs"
export LESSHISTFILE="$HOME/.cache/less/histfile"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export GEM_HOME="$XDG_CONFIG_HOME/gem/ruby/2.7.0"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export HOMEBREW_NO_AUTO_UPDATE=1

# to fix pyenv
export LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib"

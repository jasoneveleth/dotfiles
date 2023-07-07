#!/bin/zsh

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export SD_ROOT="$HOME/dotfiles/bin/.local/bin"
export LOCAL_BIN="$HOME/.local/bin"

if [ "$(uname)" = "Darwin" ]; then
    ON_A_MAC=true
fi
if [ `uname -m` = 'arm64' ]; then
    HAVE_M1=true
fi

if [[ "$HAVE_M1" = true ]]; then
    MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
    INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
fi

export ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export npm_config_devdir="$XDG_DATA_HOME"/node-gyp
# only sourced during repl, aka useless
# export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/rc.py"
# export PYLINTHOME="$XDG_CONFIG_HOME/python/pylint.d"
export PYTHONHISTFILE="$HOME/.local/share/python/history"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
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
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

if [ "$(uname)" = 'Darwin' ]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
fi

export BIBINPUTS="$XDG_CONFIG_HOME/latex"  
export NEOVIDE_MULTIGRID=1
export BAT_THEME='TwoDark'
export KEYTIMEOUT=1
export JULIA_NUM_THREADS=8
# export NTHREADS=4
export JULIA_DEPOT_PATH="$XDG_CONFIG_HOME/julia"
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --exclude node_modules --exclude __pycache__ --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PYTHONDONTWRITEBYTECODE=1
export HOMEBREW_NO_AUTO_UPDATE=1
# export VIMINIT= 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export NNN_BMS='o:~/notes;c:~/.config;v:~/.config/nvim;1:~/cs1951X/code/src;2:~/math1260;3:~/cs1730;4:~/cs1410;'
export NNN_PLUG='a:-tagadd;t:-tag-edit;v:-!nvim*'
export NNN_COLORS="4512"
export PAGER="bat"
[ "$EDITOR" = "" ] && export EDITOR="nvim --listen /tmp/nvim.sock"
export SONG="$HOME/.root/media/audio/Staff Credits 2 - Mario Kart Wii.mp3"
export VISUAL="$EDITOR"
export JOURNAL="$HOME/.root/personal/journal.md"
export NIST_JOURNAL="$HOME/.root/misc/sem05/nist_prep/journal.md"
export EXA_COLORS="*.pdf=35:*.wav=36:*.png=35:*.c=01:*.py=01"

# export LDFLAGS+=" -L/opt/homebrew/opt/binutils/lib"
# export CPPFLAGS+=" -I/opt/homebrew/opt/binutils/include"
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

export CPATH="$CPATH:$XDG_CONFIG_HOME/c"
if [[ "$HAVE_M1" = true ]]; then
    export CPATH="$CPATH:/opt/homebrew/include"
    export CPATH="$CPATH:/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.8/Headers"
    # >>> np.get_include()
    export CPATH="$CPATH:/opt/homebrew/Caskroom/miniforge/base/lib/python3.9/site-packages/numpy/core/include"
    export LIBRARY_PATH="/opt/homebrew/lib"
fi

if [[ "$HAVE_M1" = true ]]; then
    export JULIA_LOAD_PATH="~/.config/julia/environments/nvim-lspconfig:$JULIA_LOAD_PATH"
    export USING_CONDA=1
fi

# ======= PATH
front_path=()
front_path+=("$CARGO_HOME/bin")
front_path+=("$LOCAL_BIN")
if [[ "$HAVE_M1" = true ]]; then
    front_path+=("/opt/homebrew/bin" "/opt/homebrew/sbin")
    front_path+=("/opt/homebrew/opt/binutils/bin")
    front_path+=("/opt/homebrew/opt/openjdk/bin")
fi

front_path+=("/usr/local/bin")

if [ "$ON_A_MAC" = true ]; then # on apple
    path+=("/Library/TeX/texbin")
    path+=("/usr/local/opt/llvm/bin/")
    path+=("/Applications/Racket v8.2/bin")
    path+=("/nix/var/nix/profiles/default/bin")
    path+=("/usr/local/opt/openjdk/bin")
    path+=("$HOME/.elan/bin")
fi
path=($front_path $path)
path+=(".")

# remove duplicates
typeset -U path
# ======= PATH

if [[ "$HAVE_M1" = true ]]; then
    fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)
fi

setopt no_global_rcs

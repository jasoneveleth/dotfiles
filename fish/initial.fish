#!/usr/bin/env fish
set -Ux XDG_CONFIG_HOME "$HOME/.config" 
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_DATA_HOME "$HOME/.local/share"

set -Ux PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
set -Ux PYTHONHISTFILE "$XDG_DATA_HOME/share/python/history"
set -Ux PYENV_ROOT "$XDG_CONFIG_HOME/pyenv"
set -Ux MPLCONFIGDIR "$XDG_CONFIG_HOME/matplotlib"
set -Ux PYLINTHOME "$XDG_CONFIG_HOME/python/pylint.d"
set -Ux CABAL_CONFIG "$XDG_CONFIG_HOME/cabal"
set -Ux IDLESTARTUP "$XDG_CONFIG_HOME/python/idlerc"
set -Ux LESSHISTFILE "$HOME/.cache/less/histfile"
set -Ux JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"
set -Ux IPYTHONDIR "$XDG_CONFIG_HOME/ipython"
set -Ux GEM_HOME "$XDG_CONFIG_HOME/gem/ruby/2.7.0"
set -Ux NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -Ux CONDARC "$XDG_CONFIG_HOME/conda/condarc"
set -Ux BIBINPUTS "$HOME/.config/latex"  
set -Ux npm_config_devdir "$XDG_DATA_HOME"/node-gyp
set -Ux JUMP_HOME $XDG_CONFIG_HOME/jump
set -Ux GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

set -Ux KEYTIMEOUT 1
set -Ux JULIA_NUM_THREADS 4
set -Ux FZF_DEFAULT_COMMAND 'fd --type file --hidden --exclude .git --exclude node_modules --exclude __pycache__'
set -Ux FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -Ux PYTHONDONTWRITEBYTECODE 1
set -Ux HOMEBREW_NO_AUTO_UPDATE 1
set -Ux NNN_BMS 'n:~/notes;i:~/code/python/nistsurf;z:~/.config/zsh;v:~/.config/nvim;c:~/code/c;d:~/.config'
set -Ux NNN_PLUG 'e:-_ewrap $nnn*;n:-_fzfnotes*;v:-_nvim*'
set -Ux NNN_OPTS "en"
set -Ux NNN_COLORS "4512"
set -Ux PAGER "less"
set -Ux EDITOR "nvim"
set -Ux VISUAL "$EDITOR"
set -Ux JOURNAL "$HOME/.root/personal/journal.md"

set -U fish_user_paths $HOME/.local/bin $HOME/.config/pyenv/shims $fish_user_paths

set -e fish_greeting
function fish_prompt; printf "[%s:%s]%% " (hostname -s) (basename $PWD); end
funcsave fish_prompt

abbr -a '%' 'fg %1'
abbr -a cat bat
abbr -a less bat
abbr -a g git
abbr -a n nnn
abbr -a vi nvim
abbr -a top gotop
abbr -a -U -- oni oni2

# colors

set -U fish_color_autosuggestion      brblack
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'
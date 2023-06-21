# if [ -z "${USING_CONDA+x}" ]; then
#     return
# fi

# # conda ran in parent shell
# if [ ! -z "${CONDA_SHLVL+x}" ]; then
#     PROMPT="${CONDA_PROMPT_MODIFIER}${PROMPT}"
#     . "/opt/homebrew/Caskroom/miniforge/base/etc/conda/activate.d/remove_base_ps1.sh"
#     return
# fi

# # '/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null
# # BELOW IS OUTPUT OF   ^^^

# export CONDA_EXE='/opt/homebrew/Caskroom/miniforge/base/bin/conda'
# export _CE_M=''
# export _CE_CONDA=''
# export CONDA_PYTHON_EXE='/opt/homebrew/Caskroom/miniforge/base/bin/python'

# # Copyright (C) 2012 Anaconda, Inc
# # SPDX-License-Identifier: BSD-3-Clause

# __add_sys_prefix_to_path() {
#     # In dev-mode CONDA_EXE is python.exe and on Windows
#     # it is in a different relative location to condabin.
#     if [ -n "${_CE_CONDA}" ] && [ -n "${WINDIR+x}" ]; then
#         SYSP=$(\dirname "${CONDA_EXE}")
#     else
#         SYSP=$(\dirname "${CONDA_EXE}")
#         SYSP=$(\dirname "${SYSP}")
#     fi

#     if [ -n "${WINDIR+x}" ]; then
#         PATH="${SYSP}/bin:${PATH}"
#         PATH="${SYSP}/Scripts:${PATH}"
#         PATH="${SYSP}/Library/bin:${PATH}"
#         PATH="${SYSP}/Library/usr/bin:${PATH}"
#         PATH="${SYSP}/Library/mingw-w64/bin:${PATH}"
#         PATH="${SYSP}:${PATH}"
#     else
#         PATH="${SYSP}/bin:${PATH}"
#     fi
#     \export PATH
# }

# __conda_exe() (
#     __add_sys_prefix_to_path
#     "$CONDA_EXE" $_CE_M $_CE_CONDA "$@"
# )

# __conda_hashr() {
#     if [ -n "${ZSH_VERSION:+x}" ]; then
#         \rehash
#     elif [ -n "${POSH_VERSION:+x}" ]; then
#         :  # pass
#     else
#         \hash -r
#     fi
# }

# __conda_activate() {
#     if [ -n "${CONDA_PS1_BACKUP:+x}" ]; then
#         # Handle transition from shell activated with conda <= 4.3 to a subsequent activation
#         # after conda updated to >= 4.4. See issue #6173.
#         PS1="$CONDA_PS1_BACKUP"
#         \unset CONDA_PS1_BACKUP
#     fi
#     \local ask_conda
#     ask_conda="$(PS1="${PS1:-}" __conda_exe shell.posix "$@")" || \return
#     \eval "$ask_conda"
#     __conda_hashr
# }

# __conda_reactivate() {
#     \local ask_conda
#     ask_conda="$(PS1="${PS1:-}" __conda_exe shell.posix reactivate)" || \return
#     \eval "$ask_conda"
#     __conda_hashr
# }

# conda() {
#     \local cmd="${1-__missing__}"
#     case "$cmd" in
#         activate|deactivate)
#             __conda_activate "$@"
#             ;;
#         install|update|upgrade|remove|uninstall)
#             __conda_exe "$@" || \return
#             __conda_reactivate
#             ;;
#         *)
#             __conda_exe "$@"
#             ;;
#     esac
# }

# if [ -z "${CONDA_SHLVL+x}" ]; then
#     \export CONDA_SHLVL=0
#     # In dev-mode CONDA_EXE is python.exe and on Windows
#     # it is in a different relative location to condabin.
#     if [ -n "${_CE_CONDA:+x}" ] && [ -n "${WINDIR+x}" ]; then
#         PATH="$(\dirname "$CONDA_EXE")/condabin${PATH:+":${PATH}"}"
#     else
#         PATH="$(\dirname "$(\dirname "$CONDA_EXE")")/condabin${PATH:+":${PATH}"}"
#     fi
#     \export PATH

#     # We're not allowing PS1 to be unbound. It must at least be set.
#     # However, we're not exporting it, which can cause problems when starting a second shell
#     # via a first shell (i.e. starting zsh from bash).
#     if [ -z "${PS1+x}" ]; then
#         PS1=
#     fi
# fi

# # conda activate base
# # -> PS1="${PS1:-}" __conda_exe shell.posix activate base; __conda_hashr
# #    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluated for M1:
# PS1='(base) %(?.;.%F{1};%F{0}) '
# export PATH='/opt/homebrew/Caskroom/miniforge/base/bin:/opt/homebrew/Caskroom/miniforge/base/condabin:/Users/jason/.local/share/cargo/bin:/Users/jason/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/binutils/bin:/usr/local/bin:/Applications/kitty.app/Contents/MacOS:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/opt/llvm/bin:/Applications/Racket v8.2/bin:/usr/local/opt/openjdk/bin:/Users/jason/.elan/bin:.'
# export CONDA_PREFIX='/opt/homebrew/Caskroom/miniforge/base'
# export CONDA_SHLVL='1'
# export CONDA_DEFAULT_ENV='base'
# export CONDA_PROMPT_MODIFIER='(base) '
# export CONDA_EXE='/opt/homebrew/Caskroom/miniforge/base/bin/conda'
# export _CE_M=''
# export _CE_CONDA=''
# export CONDA_PYTHON_EXE='/opt/homebrew/Caskroom/miniforge/base/bin/python'
# . "/opt/homebrew/Caskroom/miniforge/base/etc/conda/activate.d/remove_base_ps1.sh"
# rehash

# FJSDLKAJKLATHKLHJFSD DSKLAJFDSJA FKLA J
# FJSDLKAJKLATHKLHJFSD DSKLAJFDSJA FKLA J
# FJSDLKAJKLATHKLHJFSD DSKLAJFDSJA FKLA J
# FJSDLKAJKLATHKLHJFSD DSKLAJFDSJA FKLA J
# FJSDLKAJKLATHKLHJFSD DSKLAJFDSJA FKLA J

export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

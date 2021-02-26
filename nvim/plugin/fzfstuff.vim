let g:fzf_layout={'down':'20%'}
let $FZF_DEFAULT_OPTS=''
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': '--prompt "> " --info=inline'}, <bang>0)

setlocal noautoindent 
setlocal nocindent 
setlocal nosmartindent 
" inoremap ( ()<++><left><left><left><left><left>
nnoremap <CR> :update<CR>:make<CR>
inoremap $ $$<++><left><left><left><left><left>
" visual and operator-pending
xnoremap i$ :<C-u> normal! T$vt$<CR>
onoremap i$ :normal vi$<CR>
xnoremap a$ :<C-u> normal!F$vf$<CR>
onoremap a$ :normal va$<CR>

inoremap <tab> <esc>/<++><CR>:noh<CR>c4l
nnoremap <tab> /<++><CR>:noh<CR>c4l

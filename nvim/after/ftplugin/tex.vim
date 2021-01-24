setlocal nowrap
setlocal sw=2
setlocal spell
packadd! tex-conceal

inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u

" visual and operator-pending
xnoremap i$ :<C-u>silent normal! lT$vt$<CR>
onoremap i$ :silent normal vi$<CR>
xnoremap a$ :<C-u>silent normal! lF$vf$<CR>
onoremap a$ :silent normal va$<CR>

" Filesystem: edit /usr/local/Cellar/neovim/0.4.4/share/nvim/runtime/syntax/tex.vim
" so that call `TexNewMathZone("E","align",1)` is in the right place

" inoremap <silent> <tab> <c-\><c-o>:call myfunctions#Tab()<cr>
" nnoremap <tab> /<++><CR>:noh<CR>c4l
" inoremap ( ()<++><left><left><left><left><left>
" nnoremap <CR> :update<CR>:make<CR>
" inoremap $ $$<++><left><left><left><left><left>

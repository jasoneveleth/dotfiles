setlocal suffixesadd=.md
" wrap long lines at a character in 'breakat' rather than last character on
" the line, doesn't insert <EOL>s (\n) in file. Not used when wrap is off.
setlocal linebreak
set tw=80
set sw=4

" https://git.peppe.rs/vim/better-text-objs/tree/plugin/better-text-objs.vim
xnoremap <buffer> ix :<C-u>normal vi`<CR>
onoremap <buffer> ix :<C-u>normal vi`<CR>
xnoremap <buffer> ax :<C-u>normal va`<CR>
onoremap <buffer> ax :<C-u>normal va`<CR>

inoremap <buffer> ;d <esc>:let @s=system('date "+%Y-%m-%d"')<cr>a<c-r>s<bs>
nnoremap <buffer> <leader>x 0f[lrx

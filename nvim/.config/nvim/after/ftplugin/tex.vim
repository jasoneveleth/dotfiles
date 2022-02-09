setlocal sw=2
" setlocal conceallevel=1
setlocal linebreak
setlocal makeprg=latexmk\ %

inoremap <buffer> . .<c-g>u
inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]a
inoremap <buffer> <c-f> <c-g>u$<space><esc>Bi$<esc>:undoj<cr>f$a
inoremap <buffer> ;d <esc>:let @s=system('date "+%Y-%m-%d"')<cr>a<c-r>s<bs>
nnoremap <buffer> <leader>ee :UltiSnipsEdit<cr>

nnoremap <buffer> <leader>g :call texcount#Texcount()<cr>

packadd ultisnips


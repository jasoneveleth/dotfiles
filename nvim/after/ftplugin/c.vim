" inoremap { <Esc>lC{}<Esc>i<CR><esc>O<esc>P==
" ino { <c-o>:call myfunctions#InsertCurlyBrace()<CR>
" ino <expr> { myfunctions#InsertCurlyBrace()
" ino <expr> <cr> myfunctions#Enter()
setlocal commentstring=//\ %s
let g:completion_trigger_character = ['.']
" setlocal omnifunc=ccomplete#Complete
set tags+=$HOME/.cache/nvim/systags
set sw=4
set smarttab
set expandtab

inoremap <buffer><silent><expr> <cr> myfun#Enter()

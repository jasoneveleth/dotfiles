" inoremap { <Esc>lC{}<Esc>i<CR><esc>O<esc>P==
" ino { <c-o>:call myfunctions#InsertCurlyBrace()<CR>
" ino <expr> { myfunctions#InsertCurlyBrace()

" setlocal omnifunc=ccomplete#Complete
setlocal commentstring=//\ %s
let g:completion_trigger_character = ['.']
set tags+=$HOME/.cache/nvim/systags
set path=.,/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include,/usr/local/include,/Users/jason/code/c/include,**,

inoremap <buffer><silent><expr> <cr> myfun#Enter()

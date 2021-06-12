" inoremap { <Esc>lC{}<Esc>i<CR><esc>O<esc>P==
" ino { <c-o>:call myfunctions#InsertCurlyBrace()<CR>
" ino <expr> { myfunctions#InsertCurlyBrace()

setlocal commentstring=//\ %s
let g:completion_trigger_character = ['.']
set tags+=$HOME/.cache/nvim/systags
if has('macunix')
set path=.,/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include,/usr/local/include,/Users/jason/code/c/include,**,
endif
set tw=80
" auto wrap in comments
set fo+=c

nnoremap <expr> gs expand('%:e') == 'h' ? ':e %:r.c<cr>' : ':e %:r.h<cr>'
inoremap <buffer><silent><expr> <cr> myfun#Enter()

" inoremap { <Esc>lC{}<Esc>i<CR><esc>O<esc>P==
" ino { <c-o>:call myfunctions#InsertCurlyBrace()<CR>
" ino <expr> { myfunctions#InsertCurlyBrace()
" ino <expr> <cr> myfunctions#Enter()
setlocal commentstring=//\ %s
let g:completion_trigger_character = ['.']

" snippets
nnoremap \cc :read ~/.config/nvim/snippets/c/comment.c<CR>

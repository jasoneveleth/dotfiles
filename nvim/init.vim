set inccommand=split
set autoread
set hidden
set number relativenumber
set ignorecase smartcase
set undofile undodir=~/.local/share/nvim/undo//
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set path=.,/usr/include/,,/Users/jasoneveleth/code/python/nistsurf/**,
set wildignore=*/.git/*,*/__pycache__/*,*.swp,.DS_Store,
set omnifunc=syntaxcomplete#Complete
set listchars=tab:»·,trail:·
let g:python3_host_prog = '/usr/bin/local/python3.8'

augroup useful
    autocmd!
    autocmd Colorscheme * highlight BackgroundWarning ctermbg=9 guibg=#be5046
    autocmd Filetype python highlight link pythonBuiltin Builtin
    autocmd Filetype vim highlight link vimAutoEvent PreProc
    autocmd Colorscheme * match BackgroundWarning /\%81v/
    autocmd QuickFixCmdPost [^l]* copen " opens quickfix window
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

let mapleader = " "
nnoremap s <C-w>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <C-L> :nohlsearch<CR>
nnoremap <Leader>g :grep<space>
nnoremap <Leader>f :find<space>
nnoremap <Leader>r :call system('/usr/local/bin/ctags -R')<CR>
nnoremap <Leader>d :call myfunctions#DiffWithSaved()<CR><CR>
nnoremap <Leader>b :call myfunctions#Buffers()<CR>
nnoremap <Leader>w :call myfunctions#StripTrailing()<CR>

packadd! cfilter
packadd! vim-commentary
packadd! vim-surround
packadd! vim-dim

silent! colorscheme dim

" TESTING
augroup notetaking
    autocmd!
    autocmd BufEnter */notes/* nnoremap <Leader>] :call myfunctions#NotesFind(0)<CR>
    autocmd BufEnter */notes/* nnoremap <Leader>} :call myfunctions#NotesFind(1)<CR>
augroup END

" SNIPPETS
nnoremap <tab><space> /<++><CR>:noh<CR>c4l
inoremap <tab><space> /<++><CR>:noh<CR>c4l

nnoremap \cc :read ~/.config/nvim/snippets/c/comment.c<CR>

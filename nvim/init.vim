set inccommand=split
set autoread
set hidden
set number relativenumber
set ignorecase smartcase
set completeopt=menu,longest
" set wildmode=longest:full,full
set undofile undodir=~/.local/share/nvim/undo//
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set path=.,/usr/include/,,~/.config/zsh/,
set tags=./tags;,./.tags;,
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
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    autocmd Filetype tex call myfunctions#Latex()
    autocmd Filetype c ino { {}<esc>i<CR><esc>O
augroup END

let mapleader = " "
nnoremap s <C-w>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
nnoremap <C-L> :nohlsearch<CR>
nnoremap <leader>g :grep<space>
nnoremap <leader>f :find<space>
vnoremap <leader>p "_dP
nnoremap <leader>c "_c
nnoremap <leader>\ :set formatoptions+=a<CR>
nnoremap <leader>r :call system('ctags -R -o .tags')<CR>
nnoremap <leader>d :call myfunctions#DiffWithSaved()<CR><CR>
nnoremap <leader>b :call myfunctions#Buffers()<CR>
nnoremap <leader>w :call myfunctions#StripTrailing()<CR>

packadd! cfilter
packadd! vim-commentary
packadd! vim-surround
packadd! vim-dim

silent! colorscheme dim

" TESTING
augroup notetaking
    autocmd!
    autocmd BufEnter */notes/* nnoremap <leader>] :call myfunctions#NotesFind(0)<CR>
    autocmd BufEnter */notes/* nnoremap <leader>} :call myfunctions#NotesFind(1)<CR>
augroup END

nnoremap <leader><tab> /<++><CR>:noh<CR>c4l
inoremap <tab> <esc>/<++><CR>:noh<CR>c4l

nnoremap \cc :read ~/.config/nvim/snippets/c/comment.c<CR>

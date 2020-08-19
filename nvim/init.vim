set confirm
set inccommand=split
set autowrite
set number relativenumber
set undofile
set undodir=~/.config/vim/undo//
set completeopt=menuone
set path=.,~/code/python/nistsurf/**,~/.config/**,
set scrolloff=3
set termguicolors
set wildcharm=<tab> " allows for completion trigger in mappings
set wildignore=*/.git/*,*/__pycache__/*,~/.config/vim/undo/*,
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.swp*,

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

augroup useful
    autocmd!
    autocmd Colorscheme * highlight BackgroundWarning ctermbg=9 guibg=#be5046
    autocmd Colorscheme * match BackgroundWarning /\%81v/
    autocmd BufWrite * %s/\s\+$//e " deletes trailing whitespace
    autocmd QuickFixCmdPost [^l]* cwindow " opens quickfix window
    autocmd QuickFixCmdPost l* lwindow
augroup END

let mapleader =" "
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
nnoremap s <C-w>
nnoremap g= g+
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]f :cnfile<CR>
nnoremap [f :cpfile<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <silent> <C-L> :nohlsearch<CR>
nnoremap <Leader>d :call<space>myfunctions#DiffSaved()<CR>
nnoremap <Leader>b :ls<CR>:b<Left>
nnoremap <Leader>r :call system('/usr/local/bin/ctags -R')
nnoremap \ :grep<space>
nnoremap <C-p> :find<space>*

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

call plug#begin('~/.config/vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' " {verb}s{char}[replacement] ys{text object}{char}
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent' "ii ai iI aI
call plug#end()

set noshowmode
let g:lightline = { 'colorscheme': 'onedark', }
colorscheme onedark
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

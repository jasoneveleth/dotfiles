"========================= normal settings ==================================
" makes vim valid
set nocompatible

" set the timeout for keycodes to be 100ms this makes sure escape is quick
" now also setting the timeout for user mappings to be 3s (but not setting
" whether this takes affect.
set ttimeout timeoutlen=3000 ttimeoutlen=100

" this sets the length of indentation (shiftwidth) to 4, and sets the length
" of a tab character (tabstop) to 4, and sets the 'experience' of a tab
" character (ie the tab and backspace keys behavior), and expands all
" tabs to spaces, and finally makes indenting take hints from filetype
set shiftwidth=4
set tabstop=4 softtabstop=4
set expandtab
set smartindent

" this makes vim ask to confirm edits rather than just throwing error, and it
" autowrites on jumps between buffers, tags, suspension
set confirm
set autowrite

" this will make vim automatically read a file again if it detects a change
" from elsewhere
set autoread

" makes colors look nice (get full RGB spectrum, not 256 random colors)
if has('termguicolors')
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" turns on status bar all the time, and shows where you are in file
set laststatus=2
set ruler

" shows line number on current line and relative line numbers on all others
set number relativenumber

" makes searching smarter, if you don't use upcase, then your search case is
" ignored
set ignorecase
set smartcase

" makes backspace work like you would expect
set backspace=indent,eol,start

" display autocompletion menu
set wildmenu

" make searching juicy
set incsearch

" show the command in the bottom right corner
set showcmd

" load all the plugins
filetype plugin indent on

" make files pretty
syntax on

" allows for persistent undo, turns off backup files
set undofile
set nobackup

" autocomplete menu now opens for one result too doesn't autofill the word
" rather, it fills the longest
set completeopt=menuone,preview

" search through subdirectories
set path+=**

" cursor won't get too close to the bottom
set scrolloff=3

" make the 81st column stand out, and trailing whitespace
augroup highlighting
    autocmd!
    autocmd Colorscheme * highlight BackgroundWarning ctermbg=9 guibg=#be5046
    autocmd Colorscheme * match BackgroundWarning /\%81v/
augroup END

"======================== remaps ============================================
" yeet text with J and K in visual mode
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" make window navigation make sense
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

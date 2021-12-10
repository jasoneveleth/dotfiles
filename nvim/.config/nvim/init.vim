if !has('nvim')
    filetype plugin indent on
    set autoindent
    set autoread
    set backspace=indent,eol,start
    set backupdir=.,~/.local/share/nvim/backup
    set belloff=all
    set complete-=i
    set cscopeverbose
    set directory=~/.local/share/nvim/swap//
    set display=lastline,msgsep
    set encoding=utf-8
    set fillchars=vert:│,fold:·,sep:│
    set formatoptions=tcqj
    set nofsync
    set history=10000
    set hlsearch
    set incsearch
    set langnoremap
    set nolangremap
    set laststatus=2
    set listchars=tab:> ,trail:-,nbsp:+
    set nrformats=bin,hex
    set ruler
    set sessionoptions+=unix,slash
    set sessionoptions-=options
    set shortmess+=F
    set shortmess-=S
    set showcmd
    set sidescroll=1
    set smarttab
    set nostartofline
    set tabpagemax=50
    set tags=./tags;,tags
    set ttimeoutlen=50
    set ttyfast
    set viewoptions=unix,slash
    set undodir=~/.local/share/nvim/undo
    set viminfo-=!
    set wildmenu
    set wildoptions=pum,tagfile
endif

set shortmess=xtToOFc
set nojoinspaces
set nowrap
set ignorecase
set smartcase
set hidden
set gdefault
set shiftround
set shiftwidth=4
set expandtab
set smarttab
set clipboard=unnamed,unnamedplus
set number
set relativenumber
set undofile
set undodir=$HOME/.local/share/nvim/undo//
set spellfile=$HOME/.local/share/nvim/en.utf-8.add
set path=.,**
set list
set listchars=tab:│\ ,extends:>
set breakindent
set breakindentopt=sbr
set showbreak=++
set omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noselect
set cursorline
set formatoptions+=r

silent! colorscheme dim

let g:mapleader = ' '
nnoremap <leader> <nop>
nnoremap <expr> k v:count == 0 ? 'gk' : 'm`' . v:count . 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'm`' . v:count . 'j'
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
nnoremap Q @q
nnoremap Y y$
nnoremap U <c-r>
nnoremap ga <c-^>
noremap gh ^
noremap gl $
xnoremap * y/\V<C-R>"<CR>
map <up> <c-y>
map <down> <c-e>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <leader>. :cd ..<cr>

nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> K :lua vim.lsp.buf.hover()<cr>
nnoremap <silent> g] :lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gr :lua vim.lsp.buf.references()<cr>
nnoremap <silent> gR :lua vim.lsp.buf.rename()<cr>
nnoremap <silent> gx :lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> <leader>gq :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <c-h> :lua vim.lsp.diagnostic.goto_prev()<cr> 
nnoremap <silent> <c-l> :lua vim.lsp.diagnostic.goto_next()<cr>
inoremap <silent> <c-k> <c-o>:lua vim.lsp.buf.signature_help()<cr>
inoremap <silent><expr> <c-l> compe#complete()

nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>e :exec 'e ~/.config/nvim/after/ftplugin/' . &ft . '.vim'<cr>
nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"
nnoremap <c-p> :Files<cr>

noremap! <c-a> <home>
noremap! <c-e> <end>

nmap <leader>P :call myfun#Paste(v:register, "l", "P")<CR>
nmap <leader>p :call myfun#Paste(v:register, "l", "p")<CR>
" nmap <leader>cP :call myfun#Paste(v:register, "v", "P")<CR>
" nmap <leader>cp :call myfun#Paste(v:register, "v", "p")<CR>

command! ConflictHighlights call myfun#ConflictsHighlight()
command! -nargs=* -bang RgRegex call myfun#RipgrepFzf(<q-args>, <bang>0)
command! PackUpdate call myfun#PackInit() | call minpac#update()
command! PackClean  call myfun#PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

augroup Startify
    autocmd!
    autocmd User Startified unmap <buffer> e
    autocmd User Startified nmap <buffer> e <plug>(startify-open-buffers)
augroup END

augroup Term
    autocmd!
    autocmd TermOpen *:/bin/zsh call feedkeys("a")
    autocmd TermOpen *:/bin/zsh set nonu nornu
    autocmd TermClose *:/bin/zsh call feedkeys("\<cr>")
    autocmd TermClose *:/bin/zsh set nu rnu
augroup END

augroup Yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup FZF
    autocmd!
    autocmd FileType fzf set nonu nornu
    autocmd BufLeave <buffer> set nu
augroup END

augroup Autocomment
    autocmd!
    " don't insert comment leader after 'o'
    autocmd BufEnter * set formatoptions-=o
augroup END

augroup cfiles
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

augroup restore_cursor
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif
augroup END

" disable some vim plugins
let g:loaded_netrwPlugin=1
let g:loaded_netrw = 1
let g:loaded_gzip=1
let g:loaded_matchit=1
let g:loaded_tarPlugin=1
let g:loaded_tar=1
let g:loaded_zipPlugin=1
let g:loaded_zip=1

let g:loaded_python_provider = 1
let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check = 1
let g:python3_host_prog = '/usr/bin/python3'

let g:netrw_dirhistmax = 0
let g:tex_flavor = 'latex'


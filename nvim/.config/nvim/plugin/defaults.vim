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

set inccommand=split
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
set tags=tags;,.tags;,
set clipboard=unnamed,unnamedplus
set number
set grepprg=rg\ --vimgrep\ --hidden\ --follow
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
set signcolumn=yes

let g:loaded_python_provider = 1
let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check = 1
let g:python3_host_prog = '/usr/bin/python3'

let g:netrw_dirhistmax = 0
let g:tex_flavor = 'latex'

" " {{{ https://sunaku.github.io/tmux-yank-osc52.html
" " copy to attached terminal using the yank(1) script:
" " https://github.com/sunaku/home/blob/master/bin/yank
" function! Yank(text) abort
"   let escape = system('yank', a:text)
"   if v:shell_error
"     echoerr escape
"   else
"     call writefile([escape], '/dev/tty', 'b')
"   endif
" endfunction
" noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>

" " automatically run yank(1) whenever yanking in Vim
" " (this snippet was contributed by Larry Sanderson)
" function! CopyYank() abort
"   call Yank(join(v:event.regcontents, "\n"))
" endfunction
" " }}}

augroup Yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    " autocmd TextYankPost * call CopyYank()
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


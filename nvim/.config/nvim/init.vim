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
set noshowcmd
set guifont=Hack:h14
set mouse=a

if &termguicolors
    silent! colorscheme onedark
else
    silent! colorscheme dim
endif

let g:mapleader = ' '
nnoremap <leader> <nop>
nnoremap <expr> k v:count == 0 ? 'gk' : 'm`' . v:count . 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'm`' . v:count . 'j'
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
nnoremap <cr> :update<cr>
nnoremap Q @q
nnoremap Y y$
nnoremap U <c-r>
nnoremap ga <c-^>
nnoremap g~ :cd ~<cr>
noremap gh ^
noremap gl $
xnoremap * y/\V<C-R>"<CR>
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>
noremap <S-ScrollWheelUp> <C-U>
noremap <S-ScrollWheelDown> <C-D>
noremap <ScrollWheelRight> zl
noremap <ScrollWheelLeft> zh
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <leader>s *``cgn
nnoremap <leader>S #``cgN
xnoremap <leader>i :'<,'>normal ^i
xnoremap <leader>a :'<,'>normal $a

" window stuff
nnoremap <leader>ww <C-w><bar>
nnoremap <leader>wt <C-w>_
nnoremap <leader>wm <C-w><bar><C-w>_
nnoremap <leader>we <C-w>=
nnoremap <leader>wc :close<cr>
nnoremap <leader>wk :Sayonara!<cr>
nnoremap <leader>wq :w<cr>:Sayonara!<cr>a

noremap <s-up>    <C-W>+
noremap <s-down>  <C-W>-
noremap <s-left>  <C-W>>
noremap <s-right> <C-W><

nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> gr :lua vim.lsp.buf.rename()<cr>
nnoremap <silent> gR :lua vim.lsp.buf.references()<cr>
nnoremap <silent> gx :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> gX :lua vim.lsp.diagnostic.goto_prev()<cr> 
nnoremap <silent> <leader>gq :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<cr>
" nnoremap <silent> g] :lua vim.lsp.buf.implementation()<cr>
" nnoremap <silent> gDt :lua vim.lsp.buf.type_definition()<cr>
" inoremap <silent> <c-k> <c-o>:lua vim.lsp.buf.signature_help()<cr>
inoremap <silent><expr> <c-l> compe#complete()

nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <c-b> :Buffers<cr>
nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <leader>e :exec 'e ~/.config/nvim/after/ftplugin/' . &ft . '.vim'<cr>
nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"

inoremap <c-k> <c-a>
noremap! <c-a> <home>
noremap! <c-e> <end>

noremap <a-h> <c-w>h
noremap <a-l> <c-w>l
noremap <a-j> <c-w>j
noremap <a-k> <c-w>k
noremap! <a-h> <c-w>h
noremap! <a-l> <c-w>l
noremap! <a-j> <c-w>j
noremap! <a-k> <c-w>k
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-l> <c-\><c-n><c-w>l
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <C-Space> <C-\><C-n>
map ˙ <a-h>
map ∆ <a-j>
map ˚ <a-k>
map ¬ <a-l>
map! ˙ <a-h>
map! ∆ <a-j>
map! ˚ <a-k>
map! ¬ <a-l>
tmap ˙ <a-h>
tmap ∆ <a-j>
tmap ˚ <a-k>
tmap ¬ <a-l>
tmap ≥ <a-.>
tmap ∫ <a-b>
tmap ∂ <a-d>
tmap ƒ <a-f>
tmap å <a-a>

" nmap <leader>P :call myfun#Paste(v:register, "l", "P")<CR>
" nmap <leader>p :call myfun#Paste(v:register, "l", "p")<CR>
" nmap <leader>cP :call myfun#Paste(v:register, "v", "P")<CR>
" nmap <leader>cp :call myfun#Paste(v:register, "v", "p")<CR>

" maps for neovide
noremap <d-0> :set guifont=Hack:h14<cr>
noremap <d--> :set guifont=Hack:h14<cr>
noremap <d-=> :set guifont=Hack:h22<cr>
inoremap <d-v> <c-r>+
tnoremap <d-v> <c-\><c-n>pa
cnoremap <d-v> <c-r>+

"ryan's maps {{{
function! FloatingFullscreen()
  let buf = bufnr('%')
  "full size
  let height = &lines - 1 - &cmdheight
  let width = &columns

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 0,
        \ 'col': 0,
        \ 'width': width,
        \ 'height': height
        \ }

  " not sure why before and after is required
  set winhighlight=NormalFloat:Normal
  let win_id = nvim_open_win(buf, v:true, opts)
  set winhighlight=NormalFloat:Normal

  return win_id
endfunction

let g:window_key_prefix = "<space>"
" the first value is the key and the second is the new window command
let g:window_key_mappings = [
            \ ["h", "aboveleft vsplit"],
            \ ["j", "belowright split"],
            \ ["k", "aboveleft split"],
            \ ["l", "belowright vsplit"],
            \ [";", "call FloatingFullscreen()"],
            \ [",", "let buf = bufnr('%') <bar> tabnew <bar> execute 'buffer' buf"],
            \ [".", ""],
            \ ["H", "topleft vsplit"],
            \ ["J", "botright split"],
            \ ["K", "topleft split"],
            \ ["L", "botright vsplit"],
            \ ]

" Create an additional set of window maps for some command.
" If user_enter is truthy (typically 1), then the command won't be automatically
" executed; the user will have to press enter. This is useful for commands
" which require user input (edit for example).
function! MapWinCmd(key, command, user_enter)
  if a:user_enter
    let suffix = ""
  else
    let suffix = "<cr>"
  endif

  for key_mapping in g:window_key_mappings
      execute "nnoremap " . g:window_key_prefix . key_mapping[0] . a:key . 
                  \ " <Cmd>" . key_mapping[1] . "<cr>:<c-u>" . a:command .
                  \ suffix
  endfor
endfunction

call MapWinCmd("e", "e ", 1)
call MapWinCmd("n", "enew <bar> setlocal bufhidden=hide nobuflisted " .
      \ "buftype=nofile", 0)
call MapWinCmd("c", "", 0)
call MapWinCmd("t", "terminal", 0)
call MapWinCmd("f", "Files", 0)
call MapWinCmd("b", "Buffers", 0)
call MapWinCmd("s", "Startify", 0)
" }}}


command! ConflictHighlights call myfun#ConflictsHighlight()
command! -nargs=* -bang RgRegex call myfun#RipgrepFzf(<q-args>, <bang>0)
command! PackUpdate call myfun#PackInit() | call minpac#update()
command! PackClean  call myfun#PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
command! SourceBookmarks call myfun#SourceBookmarks()

augroup ryan
  autocmd!
  autocmd WinEnter,TabEnter,BufWinEnter * set cursorline
  autocmd WinLeave,TabLeave * set nocursorline
augroup END

augroup Startify
    autocmd!
    autocmd User Startified unmap <buffer> e
    autocmd User Startified nmap <buffer> e <plug>(startify-open-buffers)
augroup END

augroup Term
    autocmd!
    autocmd TermOpen term://*:/bin/zsh call feedkeys("a")
    autocmd TermOpen * setlocal nonu nornu listchars= signcolumn=no scrolloff=0
    autocmd TermClose term://*:/bin/zsh call feedkeys("\<cr>")
augroup END

augroup Yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup FZF
    autocmd!
    autocmd FileType fzf setlocal nonu nornu
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

" settings for neovide
" let g:neovide_remember_window_size = v:true
let g:neovide_input_use_logo = v:true

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


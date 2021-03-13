set inccommand=split
set shortmess=xtToOFc
set nojoinspaces
set ignorecase
set smartcase
set hidden
set gdefault
set shiftround
set shiftwidth=4
set expandtab
set tags=tags;,.tags;,
set clipboard=unnamed
set number
set relativenumber
set grepprg=rg\ --vimgrep\ --hidden
set exrc
" set undofile
set undofile
set undodir=$HOME/.local/share/nvim/undo//
set spellfile=$HOME/.local/share/nvim/en.utf-8.add
set path=.,**
set list
set listchars=tab:│\ ,extends:>
set breakindent
set breakindentopt=sbr
set showbreak=++
" set cursorline
set omnifunc=syntaxcomplete#Complete

syntax off

let g:loaded_python_provider = 1
let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check = 1
let g:python3_host_prog = '$HOME/.config/pyenv/shims/python'

let g:netrw_dirhistmax = 0
let g:tex_flavor = 'latex'

nnoremap ' `
nnoremap <up> <c-y>
nnoremap <down> <c-e>
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
inoremap <up> <c-\><c-o><c-y>
inoremap <down> <c-\><c-o><c-e>

" function Osc52Yank()
"     let buffer=system('base64', @0)
"     let buffer=substitute(buffer, "\n", "", "")
"     let buffer='\e]52;c;'.buffer.'\e\'
"     silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape('/dev/tty')
" endfunction

augroup Yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    " autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END

augroup LineEnd
    autocmd!
    autocmd ColorScheme * match BackgroundWarning /\%81v/
    autocmd ColorScheme * highlight BackgroundWarning ctermbg=9 guibg=#be5046
augroup END 

augroup FZF
    autocmd!
    autocmd FileType fzf set nonu nornu
    autocmd BufLeave <buffer> set nu rnu
augroup END

augroup Autocomment
    autocmd!
    autocmd BufEnter * set formatoptions-=o
augroup END
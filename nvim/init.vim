set inccommand=split
set confirm autowrite
set number relativenumber
set ignorecase smartcase
set scrolloff=3
set undofile
set undodir=~/.local/share/nvim/undo//
set completeopt=menuone
set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set path=.,/usr/include/,,/Users/jasoneveleth/code/python/nistsurf/**,
set wildignore=*/.git/*,*/__pycache__/*,
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.swp,
let g:python3_host_prog = '/usr/bin/local/python3.8'

augroup useful
    autocmd!
    autocmd Colorscheme * highlight BackgroundWarning ctermbg=9 guibg=#be5046
    autocmd Filetype python highlight link pythonBuiltin Builtin
    autocmd Filetype vim highlight link vimAutoEvent PreProc
    autocmd Colorscheme * match BackgroundWarning /\%81v/
    autocmd BufWrite * %s/\s\+$//e " deletes trailing whitespace
    autocmd QuickFixCmdPost [^l]* copen " opens quickfix window
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 500)
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
nnoremap <Leader>b :ls<CR>:b<Left>
nnoremap <Leader>r :call system('/usr/local/bin/ctags -R')
nnoremap <Leader>d :call myfunctions#DiffWithSaved()<CR>

packadd! cfilter
packadd! vim-commentary
packadd! vim-surround
packadd! vim-dim

silent! colorscheme dim

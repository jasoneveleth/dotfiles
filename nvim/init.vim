set inccommand=split
set autoread
set hidden
set number relativenumber
set ignorecase smartcase
set nojoinspaces
" set wildmode=longest:full,full
set undofile undodir=~/.local/share/nvim/undo//
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set shiftround
set shortmess+=c
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set path=.,/usr/include/,,~/.config/zsh/,~/.config/nvim/,
set tags=./tags;,./.tags;,
set wildignore=*/.git/*,*/__pycache__/*,*.swp,.DS_Store,
set omnifunc=syntaxcomplete#Complete
filetype indent plugin on
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/local/python3.8'

augroup useful
    autocmd!
    autocmd Colorscheme * highlight BackgroundWarning ctermbg=9 guibg=#be5046
    autocmd Colorscheme * match BackgroundWarning /\%81v/
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup notetaking
    autocmd!
    autocmd BufEnter */notes/* nnoremap <leader>] :call myfunctions#NotesFind(0)<CR>
    autocmd BufEnter */notes/* nnoremap <leader>} :call myfunctions#NotesFind(1)<CR>
augroup END

let mapleader = " "
nnoremap s <C-w>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
" this will show full path
nnoremap <C-g> 1<C-g>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
nnoremap <C-L> :nohlsearch<CR>
nnoremap <leader>g :grep<space>
nnoremap <leader>f :find<space>
vnoremap <tab> >gv
vnoremap <s-tab> <gv
vnoremap <leader>p "_dP
nnoremap <leader>c :ccl<CR>
nnoremap <expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ':cope<CR>' : ':ccl<CR>' 
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

" treesitter
if has('nvim-0.5')
packadd! nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { enable = true },
}
EOF
highlight link TSPunctDelimiter Normal
highlight link TSPunctBracket Normal
highlight link TSFuncBuiltin Builtin

" packadd! completion-nvim
" packadd! completion-treesitter
" imap <silent> <C-p> <Plug>(completion_trigger)
" let g:completion_chain_complete_list = {
" 			\'default' : {
" 			\	'default' : [
" 			\		{'complete_items' : ['lsp', 'snippet']},
" 			\		{'mode' : 'file'}
" 			\	],
" 			\	'comment' : [],
" 			\	'string' : []
" 			\	},
" 			\'vim' : [
" 			\	{'complete_items': ['snippet']},
" 			\	{'mode' : 'cmd'}
" 			\	],
" 			\'c' : [
" 			\	{'complete_items': ['ts']}
" 			\	],
" 			\'python' : [
" 			\	{'complete_items': ['ts']}
" 			\	],
" 			\'lua' : [
" 			\	{'complete_items': ['ts']}
" 			\	],
" 			\}

" " Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()
endif


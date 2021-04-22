call plug#begin('~/.local/share/nvim//plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ajpaulson/julia-syntax.vim'
Plug 'jasoneveleth/vim-dim'
Plug 'wellle/targets.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" alternative: quickscope
Plug 'deris/vim-shot-f'
Plug 'junegunn/vim-peekaboo'
" Plug 'szw/vim-maximizer'
call plug#end()

if isdirectory(expand('%:h')) | silent cd %:h | endif
colorscheme dim

let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB AB rb al rB Al'
let g:CoolTotalMatches = 1
let g:peekaboo_delay = 30

" let g:fzf_layout = { 'down': '20%' }
" let $FZF_DEFAULT_OPTS=''
" command! -bang -nargs=? -complete=dir MyFiles call fzf#vim#files(<q-args>, {'options': '--prompt "> " --info=hidden'}, <bang>0)

let g:qf_auto_open_quickfix = 1
let g:qf_auto_quit = 1
let g:qf_shorten_path = 1
let g:personal_statusline = 1

" Treesitter:
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { 
        enable = true,
        disable = { "c", "python", "tex" },
    },
}
EOF

let g:mapleader = ' '
nnoremap ' `
nnoremap <leader> <nop>
xnoremap <leader>p "_dP
nnoremap <leader>p 0"_DP
" nnoremap <expr> k v:count == 0 ? 'gk' : 'm`' . v:count . 'k'
" nnoremap <expr> j v:count == 0 ? 'gj' : 'm`' . v:count . 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
vnoremap * y/<C-R>"<CR>
nnoremap <leader>a =ip
nnoremap ga <c-^>
nnoremap Q @q
nnoremap U <c-r>
" xnoremap y myy`y
" J, K in x to dP, and djp
" >, < in x to >gv and <gv OR use .

map <up> <c-y>
map <down> <c-e>

nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>s :Gstatus<cr>
nnoremap <silent> <leader>r :call system('ctags -R -o .tags')<cr>
" nnoremap <silent> <leader>b :call myfun#Buffers()<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>d :call myfun#DiffWithSaved()<cr>', { noremap = true, silent = true })
nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"
nnoremap <silent> <leader>p :Files<CR>
nnoremap <c-p> :Files<cr>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>

cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'silent make' : 'make'


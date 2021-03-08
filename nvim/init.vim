packadd cfilter

call plug#begin('~/.local/share/nvim//plugged')
Plug 'pbrisbin/vim-colors-off'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ajpaulson/julia-syntax.vim'
Plug 'jasoneveleth/vim-dim'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'romainl/vim-qf'
call plug#end()

if isdirectory('%:h') | silent cd %:h | endif

let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB AB rb al rB Al'
let g:CoolTotalMatches = 1

let g:fzf_layout = { 'down': '20%' }
let $FZF_DEFAULT_OPTS=''
command! -bang -nargs=? -complete=dir MyFiles call fzf#vim#files(<q-args>, {'options': '--prompt "> " --info=hidden'}, <bang>0)

let g:qf_auto_open_quickfix = 1
let g:qf_auto_quit = 1
let g:qf_shorten_path = 1

" Treesitter:
" require'nvim-treesitter.configs'.setup {
" highlight = { enable = true },
" incremental_selection = { enable = true },
" textobjects = { enable = true },
" indent = { 
" enable = true,
" disable = { "python", "tex" },
" },
" }

let g:mapleader = ' '
xnoremap <leaderp "_dP
xnoremap y myy`y
nnoremap <Up> <c-y>
nnoremap <Down> <c-e>
inoremap <up> <c-\><c-o><c-y>
inoremap <down> <c-\><c-o><c-e>
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
vnoremap * y/<C-R>"<CR>
noremap <leader>a =ip
" J, K in x to dP, and djp
" >, < in x to >gv and <gv OR use .

nnoremap <silent> <leader>r :call system('ctags -R -o .tags')<cr>
nnoremap <silent> <leader>b :call myfun#Buffers()<cr>
nnoremap <silent> <leader>d :call myfun#DiffWithSaved()<cr>', { noremap = true, silent = true })
nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"
nnoremap <silent> <leader>p :Files<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>

xnoremap <silent> ga <Plug>(EasyAlign)
nnoremap <silent> ga <Plug>(EasyAlign)

cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'silent make' : 'make'


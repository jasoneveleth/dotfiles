" disable some vim plugins
let g:loaded_netrwPlugin=1
let g:loaded_netrw = 1
let loaded_gzip=1
let loaded_matchit=1
let g:loaded_tarPlugin=1
let g:loaded_tar=1
let g:loaded_zipPlugin=1
let g:loaded_zip=1

call plug#begin('~/.local/share/nvim/plugged')
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
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
Plug 'chrisbra/Colorizer'

Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'deris/vim-shot-f' " alternative: quickscope
" Plug 'junegunn/vim-peekaboo'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
call plug#end()

if isdirectory(expand('%:h')) | silent cd %:h | endif
colorscheme dim

let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB AB rb al rB Al'
let g:CoolTotalMatches = 1
let g:peekaboo_delay = 120

" let g:fzf_layout = { 'down': '20%' }
" command! -bang -nargs=? -complete=dir MyFiles call fzf#vim#files(<q-args>, {'options': '--prompt "> " --info=hidden'}, <bang>0)

let g:qf_auto_open_quickfix = 1
let g:qf_auto_quit = 1
let g:qf_shorten_path = 1
let g:personal_statusline = 1
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'z': '~/.config/zsh/.zshrc'}, {'y': '~/.config/zsh/.zshenv'} ]

" Treesitter:
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = { 
        enable = true,
        disable = { "latex" },
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { 
        enable = true,
        disable = { "c", "python", "tex" },
    },
}
EOF

" Lsp:
lua require'lspconfig'.clangd.setup{}
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.ultisnips = v:true

let g:mapleader = ' '
nnoremap ' `
nnoremap <leader> <nop>
xnoremap <leader>p "_dP
nnoremap <leader>p 0"_DP
nnoremap <expr> k v:count == 0 ? 'gk' : 'm`' . v:count . 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'm`' . v:count . 'j'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
vnoremap * y/<C-R>"<CR>
nnoremap <leader>a =ip
nnoremap ga <c-^>
nnoremap Q @q
nnoremap U <c-r>
nn <left> g-
nn <right> g+
" xnoremap y myy`y
" J, K in x to dP, and djp
" >, < in x to >gv and <gv OR use .

map <up> <c-y>
map <down> <c-e>

nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>s :Gstatus<cr>
nnoremap <silent> <leader>r :call system('ctags -R -o .tags')<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>d :call myfun#DiffWithSaved()<cr>', { noremap = true, silent = true })
nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"
nmap <silent><Leader>c :call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <c-p> :Files<cr>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>

" Lsp:
nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> K :lua vim.lsp.buf.hover()<cr>
nnoremap <silent> g] :lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev()<cr> 
nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next()<cr>

cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'silent make' : 'make'

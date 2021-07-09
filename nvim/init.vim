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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-cool'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-peekaboo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ajpaulson/julia-syntax.vim'
Plug 'jasoneveleth/vim-dim'
Plug 'wellle/targets.vim'
if has('nvim-0.5')
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
endif
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
" Plug 'chrisbra/Colorizer'
Plug 'airblade/vim-rooter'
Plug 'voldikss/vim-floaterm'

" Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
" Plug 'airblade/vim-gitgutter'
" Plug 'deris/vim-shot-f' " alternative: quickscope

call plug#end()

if isdirectory(expand('%:h')) | silent cd %:h | endif
silent! colorscheme dim

let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB AB rb al rB Al'
let g:CoolTotalMatches = 1
let g:peekaboo_delay = 500
let g:rooter_patterns = ['.git', 'Makefile']
let g:rooter_silent_chdir = 1
let g:qf_auto_open_quickfix = 1
let g:qf_auto_quit = 1
let g:qf_shorten_path = 1
let g:personal_statusline = 1
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'z': '~/.config/zsh/.zshrc'}, {'y': '~/.config/zsh/.zshenv'} ]
let g:startify_custom_header = []
let g:floaterm_opener = 'vsplit'

" Treesitter:
if has('nvim-0.5')
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
lua require'lspconfig'.pyright.setup{}
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
let g:compe.source.buffer = {'ignored_filetypes': ['markdown', 'gitcommit', 'yaml']}
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true
endif

let g:mapleader = ' '
nnoremap ' `
nnoremap <leader> <nop>
nnoremap <expr> k v:count == 0 ? 'gk' : 'm`' . v:count . 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'm`' . v:count . 'j'
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
nnoremap ga <c-^>
nnoremap Q @q
nnoremap U <c-r>
noremap gh ^
noremap gl $
noremap g. `.
xnoremap <leader>p p
xnoremap p "_c<C-r>*<Esc>
xnoremap * y/<C-R>"<CR>

map <up> <c-y>
map <down> <c-e>

nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>s :FloatermNew git status<cr>
nnoremap <silent> <leader>d :FloatermNew git diff<cr>
nnoremap <silent> <leader>l yy:silent FloatermNew git log -S "<c-r>"" %<cr>
nnoremap <silent> <leader>a :Git add -A<cr>
nnoremap <silent> <leader>c :vertical Git commit --verbose<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>g :RG<cr>
nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"
nnoremap <c-p> :Files<cr>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>

" Lsp:
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> K :lua vim.lsp.buf.hover()<cr>
nnoremap <silent> g] :lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gr :lua vim.lsp.buf.references()<cr>
nnoremap <silent> gR :lua vim.lsp.buf.rename()<cr>
nnoremap <silent> gx :lua vim.lsp.buf.type_definition()<cr>
" vim.lsp.buf.signature_help()
nnoremap <silent> <leader>gq :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <c-h> :lua vim.lsp.diagnostic.goto_prev()<cr> 
nnoremap <silent> <c-l> :lua vim.lsp.diagnostic.goto_next()<cr>
inoremap <silent><expr> <c-l> compe#complete()

cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'silent make' : 'make'

" https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
" allows regex to be used
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" experimental
function! Paste(regname, pasteType, pastecmd)
  let reg_type = getregtype(a:regname)
  call setreg(a:regname, getreg(a:regname), a:pasteType)
  exe 'normal "'.a:regname . a:pastecmd
  call setreg(a:regname, getreg(a:regname), reg_type)
endfunction
nmap <Leader>lP :call Paste(v:register, "l", "P")<CR>
nmap <Leader>lp :call Paste(v:register, "l", "p")<CR>
nmap <Leader>cP :call Paste(v:register, "v", "P")<CR>
nmap <Leader>cp :call Paste(v:register, "v", "p")<CR>
nnoremap <Leader>P ""P<CR>
nnoremap <Leader>p ""p<CR>

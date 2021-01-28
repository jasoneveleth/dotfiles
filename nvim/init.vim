set incsearch inccommand=split
set noerrorbells
set shortmess=xtToOFc
set nohlsearch
set nojoinspaces
set ignorecase smartcase
set cursorline
set hidden autoread
set gdefault
set shiftwidth=4 shiftround 
set softtabstop=4 tabstop=4 expandtab
set tags=./tags;,./.tags;,
set clipboard+=unnamed
set number relativenumber
set grepprg=rg\ --vimgrep
set exrc
set undofile undodir=~/.local/share/nvim/undo//
set conceallevel=1
set completeopt=menuone,noinsert,noselect
set path=.,,~/.config/zsh/,~/.config/nvim/,
set rtp+=/usr/local/opt/fzf

augroup yanking
    autocmd! 
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    autocmd BufEnter *.jl setlocal filetype=julia
    autocmd Filetype tex setlocal makeprg=maketex\ %
augroup END

let mapleader=" "
nnoremap <leader>r :call system('ctags -R -o .tags')<cr>
xnoremap <leader>p "_dP
nnoremap <Up> <c-y>
nnoremap <Down> <c-e>

packadd! vim-surround

if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    augroup makingCommands
        autocmd!
        autocmd Filetype julia command! Make call VSCodeNotify('language-julia.executeFile')
        autocmd Filetype python command! Make call VSCodeNotify('python.execInTerminal')
    augroup END
    cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'Make' : 'make'
    finish
endif

filetype indent plugin on
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/Users/jasoneveleth/.config/pyenv/shims/python'
let g:tex_flavor = "latex"

nnoremap <leader>f :FZF<cr>
nnoremap <leader>b :call myfunctions#Buffers()<cr>
nnoremap <leader>d :call myfunctions#DiffWithSaved()<cr>
nnoremap <expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ':cope<cr>' : ':ccl<cr>' 

packadd! cfilter
packadd! vim-commentary
packadd! vim-tmux-navigator
packadd! nvim-treesitter
packadd! completion-treesitter
packadd! completion-nvim
packadd! neosnippet

silent! colorscheme dim

" Neosnippet: mappings
imap <expr> <tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
smap <tab>     <Plug>(neosnippet_expand_or_jump)
xmap <tab>     <Plug>(neosnippet_expand_target)
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#snippets_directory = "~/dotfiles/nvim/mysnippets"

" Treesitter:
lua<<EOF
require'nvim-treesitter.configs'.setup {
highlight = { enable = true },
incremental_selection = { enable = true },
textobjects = { enable = true },
indent = { 
enable = true,
disable = { "python", "tex" },
},
}
EOF
highlight link TSPunctDelimiter Normal
highlight link TSPunctBracket Normal
highlight link TSFuncBuiltin Builtin


" Completion:
let g:completion_enable_auto_popup = 0
let g:completion_auto_change_source = 1
let g:completion_matching_strategy_list = ['exact', 'substring']
let g:completion_enable_snippet = 'Neosnippet'
let g:completion_chain_complete_list = [
            \{'complete_items' : ['ts', 'snippet']}, 
            \{'mode' : '<c-p>' },
            \{'mode' : '<c-n>' }
            \]
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
imap <silent> <c-p> <Plug>(completion_trigger)


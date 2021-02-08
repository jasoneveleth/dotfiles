set incsearch inccommand=split
set noerrorbells
set shortmess=xtToOFc
set nohlsearch
set nojoinspaces
set ignorecase smartcase
set hidden autoread
set gdefault
set autoindent
set shiftwidth=4 shiftround 
set softtabstop=4 expandtab
set tags=./tags;,./.tags;,~/.config/nvim/systags
set clipboard+=unnamed
set number relativenumber
set grepprg=rg\ --vimgrep
set exrc
set undofile undodir=~/.local/share/nvim/undo//
set conceallevel=1
set completeopt=menuone
set shada=!,'20,<50,s10,h
set path=.,,~/.config/zsh/,~/.config/nvim/,
set runtimepath+=/usr/local/opt/fzf
set list listchars=tab:│\ ,extends:>
set breakindent breakindentopt=sbr
set showbreak=↪>\ 

" call myfun#HardMode()

augroup yanking
    autocmd! 
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    autocmd BufEnter *.jl setlocal filetype=julia
augroup END

let mapleader=" "
nnoremap <leader>r :call system('ctags -R -o .tags')<cr>
xnoremap <leader>p "_dP
xnoremap y myy`y
nnoremap <Up> <c-y>
nnoremap <Down> <c-e>
xnoremap i, :<C-u>silent normal! lT,vt,<CR>
onoremap i, :silent normal vi,<CR>
xnoremap a, :<C-u>silent normal! lF,vf,<CR>
onoremap a, :silent normal va,<CR>
nnoremap ' `

packadd! vim-surround

if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    nnoremap <leader>b :call VSCodeNotify('workbench.action.quickOpen')<CR>
    augroup makingCommands
        autocmd!
        autocmd Filetype julia command! Make call VSCodeNotify('language-julia.executeFile')
        autocmd Filetype python command! Make call VSCodeNotify('python.execInTerminal')
    augroup END
    cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'Make' : 'make'
    finish
endif

nnoremap <leader>g :grep<space>
nnoremap <silent> <leader>b :call myfun#Buffers()<cr>
nnoremap <leader>d :call myfun#DiffWithSaved()<cr>
nnoremap <expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ':cope<cr>' : ':ccl<cr>' 
" hacky bc I exploit that my path starts with '.,,'
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
nnoremap <leader>f :call fzf#run(fzf#wrap({'source' : 'getfiles ' . substitute(getcwd() . ',' . expand('%:p:h') . ',' . &path[3:], ',', ' ', 'g')}))<cr><cr>

packadd! cfilter
packadd! vim-commentary
packadd! vim-tmux-navigator
packadd! nvim-treesitter
packadd! ultisnips
" packadd! neosnippet
packadd! vimtex
packadd! vim-easy-align
" packadd! completion-treesitter
" packadd! completion-nvim

silent! colorscheme dim

filetype indent plugin on
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/Users/jasoneveleth/.config/pyenv/shims/python'
let g:tex_flavor = "latex"

" Easy Align:
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" " Neosnippet: mappings
" imap <expr> <tab> myfun#Tab()
" smap <tab>     <Plug>(neosnippet_expand_or_jump)
" xmap <tab>     <Plug>(neosnippet_expand_target)
" let g:neosnippet#disable_runtime_snippets = {'_' : 1}
" let g:neosnippet#snippets_directory = "~/dotfiles/nvim/mysnippets"

" Ultisnip:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

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
highlight link TSFuncBuiltin Builtin
highlight link TSPunctDelimiter Normal
highlight link TSPunctBracket Normal

" " Completion:
" let g:completion_enable_auto_popup = 1
" let g:completion_trigger_keyword_length = 3
" let g:completion_auto_change_source = 1
" let g:completion_matching_strategy_list = ['exact', 'substring']
" let g:completion_enable_snippet = 'Neosnippet'
" let g:completion_chain_complete_list = [
"             \{'complete_items' : ['ts', 'snippet']}, 
"             \{'mode' : 'omni,tags'},
"             \{'mode' : '<c-p>' },
"             \{'mode' : '<c-n>' }
"             \]
" " Use completion-nvim in every buffer
" autocmd BufEnter *.c,*.h,*.jl,*.py,*.html,*.js,*.java,*.sh,*.zsh lua require'completion'.on_attach()
" imap <silent> <c-k> <Plug>(completion_trigger)
" set completeopt+=noselect


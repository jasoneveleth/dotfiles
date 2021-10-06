" disable some vim plugins
let g:loaded_netrwPlugin=1
let g:loaded_netrw = 1
let loaded_gzip=1
let loaded_matchit=1
let g:loaded_tarPlugin=1
let g:loaded_tar=1
let g:loaded_zipPlugin=1
let g:loaded_zip=1

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" let g:vimtex_quickfix_mode=0

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
let g:startify_files_number = 5
let g:floaterm_opener = 'vsplit'

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
let g:compe.source.buffer = {'ignored_filetypes': ['markdown', 'gitcommit', 'yaml', 'tex']}
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true

silent! colorscheme dim

let g:mapleader = ' '
nnoremap ' `
nnoremap <leader> <nop>
nnoremap <expr> k v:count == 0 ? 'gk' : 'm`' . v:count . 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'm`' . v:count . 'j'
nnoremap <c-j> :cnext<cr>
nnoremap <c-k> :cprevious<cr>
nnoremap ga <c-^>
nnoremap Q @q
nnoremap Y y$
nnoremap U <c-r>
noremap gh ^
noremap gl $
noremap g. `.
xnoremap * y/\V<C-R>"<CR>
map <up> <c-y>
map <down> <c-e>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> K :lua vim.lsp.buf.hover()<cr>
nnoremap <silent> g] :lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gr :lua vim.lsp.buf.references()<cr>
nnoremap <silent> gR :lua vim.lsp.buf.rename()<cr>
nnoremap <silent> gx :lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> <leader>gq :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <c-h> :lua vim.lsp.diagnostic.goto_prev()<cr> 
nnoremap <silent> <c-l> :lua vim.lsp.diagnostic.goto_next()<cr>
inoremap <silent> <c-k> <c-o>:lua vim.lsp.buf.signature_help()<cr>
inoremap <silent><expr> <c-l> compe#complete()

nnoremap <leader>h :<c-u>aboveleft vsplit<cr>:Files<cr>
nnoremap <leader>j :<c-u>belowright split<cr>:Files<cr>
nnoremap <leader>k :<c-u>aboveleft split<cr>:Files<cr>
nnoremap <leader>l :<c-u>belowright vsplit<cr>:Files<cr>

nnoremap <silent> <leader>u :UndotreeToggle<cr>
nnoremap <silent> <leader>s :FloatermNew git status<cr>
nnoremap <silent> <leader>d :FloatermNew git diff<cr>
nnoremap <silent> <leader>y yy:silent FloatermNew git log -S "<c-r>"" %<cr>
nnoremap <silent> <leader>a :Git add -A<cr>
nnoremap <silent> <leader>c :vertical Git commit --verbose<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>g :RG<cr>
nnoremap <silent> <leader>e :exec 'e ~/.config/nvim/after/ftplugin/' . &ft . '.vim'<cr>
nnoremap <silent><expr> <leader>o filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')==[] ? ":cope<cr>" : ":ccl<cr>"
nnoremap <c-p> :Files<cr>

nmap <leader>P :call myfun#Paste(v:register, "l", "P")<CR>
nmap <leader>p :call myfun#Paste(v:register, "l", "p")<CR>
" nmap <leader>cP :call myfun#Paste(v:register, "v", "P")<CR>
" nmap <leader>cp :call myfun#Paste(v:register, "v", "p")<CR>

cabbrev <expr> make getcmdtype() == ":" && getcmdline() == 'make' ? 'silent make' : 'make'

command! ConflictHighlights call myfun#ConflictsHighlight()
command! -nargs=* -bang RG call myfun#RipgrepFzf(<q-args>, <bang>0)
command! PackUpdate call myfun#PackInit() | call minpac#update()
command! PackClean  call myfun#PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()


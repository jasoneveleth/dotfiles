local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local g = vim.g

o.inccommand = 'split'
o.shortmess = 'xtToOFc'
o.joinspaces = false
o.ignorecase = true
o.smartcase = true
o.hidden = true
o.gdefault = true
o.shiftround = true
bo.shiftwidth = 4
bo.expandtab = true
o.tags = 'tags;,.tags;,'
o.clipboard = 'unnamed'
wo.number = true
wo.relativenumber = true
o.grepprg = 'rg --vimgrep --hidden'
o.exrc = true
-- bo.undofile = true
cmd('set undofile')
o.undodir = vim.env.HOME .. '/.local/share/nvim/undo//'
o.path = '.,**'
wo.list = true
o.listchars = 'tab:│ ,extends:>'
wo.breakindent = true
wo.breakindentopt = 'sbr'
o.showbreak = '++'
-- wo.cursorline = true
bo.omnifunc = 'syntaxcomplete#Complete'

cmd('silent cd %:h')
-- cmd('syntax enable')
cmd('syntax off')
cmd('hi MatchParen ctermbg=8 ctermfg=NONE')
-- cmd('colorscheme off')
-- o.background = 'dark'

g.loaded_python_provider = 1
g.python_host_skip_check = 1
g.python_host_prog = '/usr/bin/python'
g.python3_host_skip_check = 1
g.python3_host_prog = '$HOME/.config/pyenv/shims/python'

g.netrw_dirhistmax = 0
g.tex_flavor = 'latex'

g.vimtex_view_method = 'skim'
g.vimtex_fold_manual = 1

g.targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB AB rb al rB Al'
g.CoolTotalMatches = 1

g.UltiSnipsExpandTrigger = "<tab>"
g.UltiSnipsJumpForwardTrigger = "<tab>"
g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
g.UltiSnipsSnippetDirectories = {"ftplugin/my_snippets"}
-- ultisnip nvim fix: https://github.com/neovim/neovim/issues/5728#issuecomment-406475616

g.fzf_layout = { down = '20%' }
cmd("let $FZF_DEFAULT_OPTS=''")
cmd("command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': '--prompt \"> \" --info=inline'}, <bang>0)")

g.qf_auto_open_quickfix = 1
g.qf_auto_quit = 1
g.qf_shorten_path = 1

-- -- Treesitter:
-- require'nvim-treesitter.configs'.setup {
-- highlight = { enable = true },
-- incremental_selection = { enable = true },
-- textobjects = { enable = true },
-- indent = { 
-- enable = true,
-- disable = { "python", "tex" },
-- },
-- }
-- -- highlight link TSFuncBuiltin Builtin
-- -- highlight link TSPunctDelimiter Normal
-- -- highlight link TSPunctBracket Normal

-- -- Neosnippet: 
-- let g:neosnippet#disable_runtime_snippets = {'_' : 1}
-- let g:neosnippet#snippets_directory = "~/dotfiles/nvim/mysnippets"

-- -- Completion:
-- let g:completion_enable_auto_popup = 1
-- let g:completion_trigger_keyword_length = 3
-- let g:completion_auto_change_source = 1
-- let g:completion_matching_strategy_list = ['exact', 'substring']
-- let g:completion_enable_snippet = 'Neosnippet'
-- let g:completion_chain_complete_list = [
--             \{'complete_items' : ['ts', 'snippet']}, 
--             \{'mode' : 'omni,tags'},
--             \{'mode' : '<c-p>' },
--             \{'mode' : '<c-n>' }
--             \]
-- " Use completion-nvim in every buffer
-- autocmd BufEnter *.c,*.h,*.jl,*.py,*.html,*.js,*.java,*.sh,*.zsh lua require'completion'.on_attach()
-- imap <silent> <c-k> <Plug>(completion_trigger)
-- set completeopt+=noselect

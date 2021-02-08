local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd

o.incsearch = true
o.inccommand = 'split'
o.shortmess = 'xtToOFc'
o.hlsearch = false
o.joinspaces = true
o.ignorecase = true
o.smartcase = true
o.hidden = true
o.autoread = true
o.gdefault = true
o.autoindent = true
o.shiftround = true
bo.shiftwidth = 4
bo.expandtab = true
bo.softtabstop = 4
bo.tabstop = 4
o.tags = './tags;,./.tags;,' .. vim.env.HOME .. '/.config/nvim/systags'
o.clipboard = 'unnamed'
wo.number = true
wo.relativenumber = true
o.grepprg = 'rg --vimgrep'
o.exrc = true
bo.undofile = true
o.undodir = vim.env.HOME .. '/.local/share/nvim/undo//'
o.path = '.,,' .. vim.env.HOME .. '/.config/nvim/**,' .. vim.env.HOME .. '/.config/zsh/**'
o.completeopt = 'menuone'
o.runtimepath = o.runtimepath .. ',/usr/local/opt/fzf'
wo.list = true
o.listchars = 'tab:│ ,extends:>'
wo.breakindent = true
wo.breakindentopt = 'sbr'
o.showbreak = '+++ '
wo.cursorline = true

vim.cmd('syntax on')
vim.cmd('colorscheme off')
o.background = 'dark'

vim.g.python3_host_prog = '$HOME/.config/pyenv/shims/python'
vim.g.netrw_dirhistmax = 0

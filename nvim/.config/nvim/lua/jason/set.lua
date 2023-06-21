vim.opt.laststatus = 0
vim.opt.ruler = false
vim.opt.shortmess = "xtToOFcS"
vim.opt.joinspaces = false
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.gdefault = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo//"
vim.opt.spellfile = os.getenv("HOME") .. "/.local/share/nvim/en.utf-8.add"
vim.opt.list = true
vim.opt.breakindent = true
-- indent lists using length of thier pattern
vim.opt.breakindentopt = "list:-1"
vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline = true
vim.opt.formatoptions = "rcqnlj"
vim.opt.showcmd = false
vim.opt.guifont = "Hack:h14"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.g.mapleader = " "


vim.cmd([[if !exists("loaded_colorscheme")
    if &termguicolors
        silent! colorscheme onedark
        silent! hi CursorLineNr gui=bold
    else
        silent! colorscheme dim
    endif
endif
let g:loaded_colorscheme = 1
]])

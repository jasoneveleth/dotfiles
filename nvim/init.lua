vim.cmd 'packadd paq-nvim'

local paq = require'paq-nvim'.paq
paq{'savq/paq-nvim', opt=true}

paq 'andreypopp/vim-colors-plain'
paq 'pbrisbin/vim-colors-off'
paq 'tpope/vim-surround'
paq 'tpope/vim-rsi'
paq 'tpope/vim-commentary'
paq 'christoomey/vim-tmux-navigator'
paq 'ajpaulson/julia-syntax.vim'
paq 'jasoneveleth/vim-dim'

-- ultisnips
-- vimtex

require('settings')
require('maps')


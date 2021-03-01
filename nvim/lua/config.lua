vim.cmd 'packadd paq-nvim'
vim.cmd 'packadd cfilter'

local paq = require'paq-nvim'.paq
paq{'savq/paq-nvim', opt=true}

paq 'pbrisbin/vim-colors-off'
paq 'tpope/vim-surround'
paq 'tpope/vim-rsi'
paq 'tpope/vim-commentary'
paq 'christoomey/vim-tmux-navigator'
paq 'ajpaulson/julia-syntax.vim'
paq 'jasoneveleth/vim-dim'
paq 'junegunn/vim-easy-align'
paq 'wellle/targets.vim'
paq 'romainl/vim-cool'
paq 'junegunn/fzf.vim'
paq 'junegunn/fzf'

require('settings')
require('maps')


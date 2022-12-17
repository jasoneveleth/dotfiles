vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-eunuch'
  use 'romainl/vim-cool'
  use 'junegunn/fzf.vim'
  use 'junegunn/fzf'
  use 'junegunn/vim-peekaboo'
  use 'jasoneveleth/vim-dim'
  use 'mhinz/vim-startify'
  use 'mhinz/vim-sayonara'
  use 'mbbill/undotree'
  use 'joshdick/onedark.vim'
  use 'jasoneveleth/treesitter_latex_mathmode.nvim'
  use 'dkarter/bullets.vim'
  use 'PeterRincker/vim-argumentative'
  use 'justinmk/vim-sneak'
  use 'Raimondi/delimitMate'
  use 'tjdevries/train.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'Julian/lean.nvim'
  use 'lervag/vimtex'
  use 'airblade/vim-gitgutter'
  use 'nvim-treesitter/playground'
  use 'tommcdo/vim-lion'
  use 'michaeljsmith/vim-indent-object'
  use 'AndrewRadev/splitjoin.vim'
  use 'bfredl/nvim-miniyank'
  use 'weakish/rcshell.vim'
  use 'dhruvasagar/vim-table-mode'
  use 'TimUntersberger/neogit'

  use 'vim-pandoc/vim-pandoc-syntax'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use "folke/noice.nvim"
  use "MunifTanjim/nui.nvim"
  use "rcarriga/nvim-notify"
end)
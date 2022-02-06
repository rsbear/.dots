-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v0.1.0', -- Optional tag release
  }

  -- use { 'tpope/vim-commentary' }

  -- COMMONS
  use { 'nvim-lua/plenary.nvim', module = 'plenary' }
  use { 'nvim-lua/popup.nvim', module = 'popup' }

  -- TREESITTER
  use {
    'nvim-treesitter/nvim-treesitter',
    config = require 'modules.treesitter',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
    },
  }

  -- LSP AND LANG
  use { 'folke/lsp-colors.nvim' }
  use {
    'hrsh7th/nvim-cmp',
    config = require 'modules.cmp',
    requires = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      { 'L3MON4D3/LuaSnip', config = require 'modules.luasnip' },
    },
  }
  use {
    'neovim/nvim-lspconfig',
    config = require 'modules.lsp',
    requires = {
      'williamboman/nvim-lsp-installer',
      -- 'ray-x/lsp_signature.nvim',
    },
  }
  -- use {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   config = require 'modules.lsp.nulls',
  --   requires = { 'nvim-lua/plenary.nvim' },
  -- }

  -- FUZZY
  use {
    'folke/trouble.nvim',
    config = require 'modules.trouble',
  }
  use {
    'nvim-telescope/telescope.nvim',
    config = require 'modules.telescope',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
  }
  use {
    'rlane/pounce.nvim',
    config = require 'modules.pouncer',
  }

  -- SEARCH AND REPLACE
  use {
    'VonHeikemen/searchbox.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' },
    },
  }

  -- GIT
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require 'modules.git_signs',
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = require 'modules.neogit',
  }

  -- TABLINE
  use { 'romgrk/barbar.nvim', config = require 'modules.barbruh' }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = require 'modules.neotree',
  }

  -- DASHBOARD
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require 'modules.alpha-dashboard',
  }

  -- FLOATING TERMINAL
  use { 'numToStr/FTerm.nvim', config = require 'modules.floatterm' }

  -- should be in vim core
  use { 'tpope/vim-surround' }

  -- haha uh oh
  use { 'github/copilot.vim' }

  -- easy motion
  use { 'phaazon/hop.nvim', config = require 'modules.hop' }

  -- which key
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end,
  }

  -- notification component
  use { 'MunifTanjim/nui.nvim' }

  -- writer mode
  -- use 'junegunn/goyo.vim'
  -- use 'junegunn/limelight.vim'
  use {
    'folke/zen-mode.nvim',
    config = require 'modules.zenmode',
  }
  use {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {}
    end,
  }

  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  }

  -- AUTO PAIRS
  use {
    'windwp/nvim-autopairs',
    config = require 'modules.autopairs',
  }

  use {
    'numToStr/Comment.nvim',
    opt = true,
    keys = { 'gc', 'gcc', 'gbc' },
    config = function()
      require 'modules.comments'
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require 'modules.lualine',
  }

  -- disable search highlight on move
  use { 'romainl/vim-cool' }

  -- THIS SHIT GOTTA BE PRETTY YOU KNOW
  use 'folke/tokyonight.nvim'
  use 'wadackel/vim-dogrun'
  use 'kvrohit/substrata.nvim'

  -- require('packer').compile()
  -- require('packer').install()
  -- require 'modules.nui-popup'
end)

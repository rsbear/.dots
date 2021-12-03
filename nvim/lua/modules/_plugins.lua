-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager

	-- COMMONS
	use({ "nvim-lua/plenary.nvim", module = "plenary" })
	use({ "nvim-lua/popup.nvim", module = "popup" })

	-- TREESITTER
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require("modules.treesitter"),
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
	})

	-- LSP AND LANG
	use({ "folke/lsp-colors.nvim" })
	use({
		"hrsh7th/nvim-cmp",
		config = require("modules.cmp"),
		requires = {
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
			{ "L3MON4D3/LuaSnip", config = require("modules.luasnip") },
		},
	})
	use({
		"neovim/nvim-lspconfig",
		config = require("modules.lsp"),
		requires = {
			"williamboman/nvim-lsp-installer",
			-- 'ray-x/lsp_signature.nvim',
		},
	})

	-- FUZZY
	use({
		"folke/trouble.nvim",
		config = require("modules.trouble"),
	})
	use({
		"nvim-telescope/telescope.nvim",
		config = require("modules.telescope"),
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- -- Add indentation guides even on blank lines
	-- use 'lukas-reineke/indent-blankline.nvim'

	-- GIT
	use({
		"lewis6991/gitsigns.nvim",
		config = require("modules.gitsigns"),
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = require("modules.neogit"),
	})

	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	-- use 'rbong/vim-flog'
	-- use 'rhysd/git-messenger.vim'

	-- EXPLORER
	use({
		"kyazdani42/nvim-tree.lua",
		config = require("modules.nvim_tree"),
	})

	-- DASHBOARD
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = require("modules.alpha-dashboard"),
	})

	-- should be in vim core
	use({ "tpope/vim-surround" })

	-- haha uh oh
	use({ "github/copilot.vim" })

	-- easy motion
	use({
		"phaazon/hop.nvim",
		config = require("modules.hop"),
	})

	-- writer mode
	use("junegunn/goyo.vim")
	use("junegunn/limelight.vim")

	-- buff tabs
	-- use {
	--   'noib3/cokeline.nvim',
	--   config = require 'modules.cokeline',
	-- }

	--  LUXURY
	use("wadackel/vim-dogrun")
	use("arzg/vim-substrata")
	use("folke/tokyonight.nvim")

	use("tpope/vim-commentary")
	use("ap/vim-buftabline")
	use("jiangmiao/auto-pairs")
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})
	-- use 'itchyny/lightline.vim'

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = require("modules.lualine"),
	})

	-- OLD unused
	-- use("kyazdani42/nvim-web-devicons")

	-- require('packer').compile()
	-- require('packer').install()
end)

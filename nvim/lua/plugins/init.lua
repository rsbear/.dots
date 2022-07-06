-- Install packerp
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		-- tag = 'v1.*', -- Optional tag release
		config = function()
			require("rose-pine").setup({
				dark_variant = "main",
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,
				groups = {
					TSString = { style = "italic" },
				},
				highlight_groups = {
					GitSignsAdd = { fg = "#008D83" },
					-- GitSignsChange = { fg = '#f6c177' },
					-- IndentBlanklineChar = { fg = "#2c2a36" },
					IndentBlanklineChar = { fg = "#191724" },
					FloatBorder = { fg = "#2a273f", bg = "none" },
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	})
	-- use("kvrohit/substrata.nvim")

	----------------------------
	-- COMMONS
	----------------------------
	use({ "nvim-lua/plenary.nvim", module = "plenary" })
	use({ "nvim-lua/popup.nvim", module = "popup" })

	----------------------------
	-- TREESITTER
	----------------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require("plugins.treeshitter"),
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
	})

	----------------------------
	-- LSP AND LANG
	----------------------------
	use({ "folke/lsp-colors.nvim" })
	use({ "L3MON4D3/LuaSnip", config = require("plugins.luasnips") })
	use({
		"hrsh7th/nvim-cmp",
		config = require("plugins.cmpp"),
		requires = {
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
		},
	})

	use({ "saadparwaiz1/cmp_luasnip" })
	use({
		"neovim/nvim-lspconfig",
		config = require("plugins.lsp"),
		requires = {
			"williamboman/nvim-lsp-installer",
			-- 'ray-x/lsp_signature.nvim',
		},
	})

	use({ "RishabhRD/popfix" })
	use({ "RishabhRD/nvim-lsputils" })

	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	----------------------------
	-- FUZZY
	----------------------------
	use({
		"folke/trouble.nvim",
		config = require("plugins.trouble"),
	})
	use({
		"nvim-telescope/telescope.nvim",
		config = require("plugins.telescope"),
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({
		"phaazon/hop.nvim",
		config = require("plugins.tinycfg").hop(),
	})

	----------------------------
	-- SEARCH AND REPLACE
	----------------------------
	use({
		"VonHeikemen/searchbox.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})

	----------------------------
	-- MODES
	------------------------------

	use({
		"mvllow/modes.nvim",
		event = "BufRead",
		config = require("plugins.tinycfg").modes(),
	})

	----------------------------
	-- GIT
	----------------------------
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require("plugins.git_signs"),
	})
	use({
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		config = require("plugins.neogitter"),
	})
	use({
		"dinhhuy258/git.nvim",
		config = require("plugins.tinycfg").git(),
	})
	-- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	----------------------------
	-- TABLINE
	----------------------------
	use({ "romgrk/barbar.nvim", config = require("plugins.barbruh") })

	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	config = require("plugins.lualinee"),
	-- })

	----------------------------
	-- EXPLORER
	----------------------------
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = require("plugins.neotree"),
	})

	----------------------------
	-- DASHBOARD
	----------------------------
	use({ "glepnir/dashboard-nvim" })

	----------------------------
	-- FLOATING TERMINAL
	----------------------------
	use({ "numToStr/FTerm.nvim", config = require("plugins.floatterm") })

	----------------------------
	-- should be in vim core
	----------------------------
	use({ "tpope/vim-surround" })

	-- haha uh oh
	use({ "github/copilot.vim" })
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					cmp = {
						enabled = true,
						method = "getCompletionsCycling",
					},
					ft_disable = { "markdown" },
				})
			end, 100)
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		module = "copilot_cmp",
	})

	-- stuff
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({ filetype_exclude = { "dashboard" } })
		end,
	})

	-- which key
	use({
		"folke/which-key.nvim",
		config = require("plugins.tinycfg").whichkey(),
	})
	----------------------------
	-- writer mode
	---------------------------
	use({
		"folke/zen-mode.nvim",
		config = require("plugins.zenmode"),
	})

	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	})

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})

	----------------------------
	-- COLOUR PICKER
	----------------------------
	use({
		"ziontee113/color-picker.nvim",
		config = require("plugins.colourpicker"),
	})

	----------------------------
	-- AUTO PAIRS
	----------------------------
	use({
		"windwp/nvim-autopairs",
		config = require("plugins.autopairs"),
	})

	----------------------------
	-- COMMENT
	----------------------------

	use({
		"numToStr/Comment.nvim",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("plugins.comments")
		end,
	})

	-- disable search highlight on move
	use({ "romainl/vim-cool" })

	-- require('packer').compile()
	-- require('packer').install()
	-- require 'plugins.nui-popup'
end)

local use = require("rs-utils").use

-- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

use("tpope/vim-fugitive")
use("tpope/vim-rhubarb")

use({
	"TimUntersberger/neogit",
	requires = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("neogit").setup({
			disable_commit_confirmation = true,
			sections = {
				unpulled = {
					folded = true,
				},
				unmerged = {
					folded = false,
				},
				recent = {
					folded = true,
				},
			},
			mappings = {
				status = {
					-- Adds a mapping with "B" as key that does the "BranchPopup" command
					["B"] = "BranchPopup",
					-- Removes the default mapping of "s"
					["<leader>q"] = "Close",
				},
			},
		})
	end,
})

use({
	"dinhhuy258/git.nvim",
	config = function()
		require("git").setup({
			keymaps = {
				blame = "<leader>gb",
				browse = "<leader>go",
			},
		})
	end,
})

use({
	"lewis6991/gitsigns.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { hl = "GitSignsAdd", text = "│" },
				change = { hl = "GitGutterChange", text = "│" },
				delete = { hl = "GitGutterDelete", text = "_" },
				topdelete = { hl = "GitGutterDelete", text = "‾" },
				changedelete = { hl = "GitGutterChange", text = "~" },
			},
		})
	end,
})

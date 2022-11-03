local use = require("rs-utils").use

use({
	"nvim-telescope/telescope.nvim",
	requires = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local trouble = require("trouble.providers.telescope")

		require("telescope").setup({
			defaults = {
				path_display = {
					shorten = 7,
				},
				vimgrep_arguments = {
					"rg",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				layout_config = {
					horizontal = { width = 0.9 },
				},
				file_ignore_patterns = {
					"node_modules",
					"yarn.lock",
					"yarn-error.log",
					"pnpm-lock.yaml",
					"package-lock.json",
					".git",
					"dist",
				},
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
						["<C-t>"] = trouble.open_with_trouble,
					},
					n = {
						["<C-t>"] = trouble.open_with_trouble,
					},
				},
			},
			pickers = {
				git_status = { shorten_path = true },
				live_grep = { theme = "ivy" },
				buffers = { theme = "ivy" },
				-- find_files = {
					-- theme = "dropdown",
					-- previewer = false 
				-- },
			},
		})
	end,
})

use({
	"phaazon/hop.nvim",
	config = function()
		require("hop").setup()
	end,
})

use({ -- search and replace
	"VonHeikemen/searchbox.nvim",
	requires = {
		{ "MunifTanjim/nui.nvim" },
	},
})

use({
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({
			plugins = {
				presets = {
					-- Disable operators
					operators = false,
				},
			},
		})
	end,
})

local use = require("rs-utils").use

use("famiu/bufdelete.nvim")

use({
	"romgrk/barbar.nvim",
	config = function()
		require("bufferline").setup({
			closable = false,
			clickable = false,
			icon_separator_inactive = "",
			icon_separator_active = "",
			icon_custom_colors = true,
			icons = false,
			icon_close_tab = "",
			icon_close_tab_modified = "",
			insert_at_end = true,
			insert_at_start = false,
			maximum_padding = 0,
			no_name_title = "[nullish]",
		})
	end,
})

use({
	"nvim-neo-tree/neo-tree.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
				},
			},
			filesystem = {
				filters = { --These filters are applied to both browsing and searching
					show_hidden = true,
					respect_gitignore = false,
				},
				use_libuv_file_watcher = true,
				window = {
					popup = {
						position = { col = "0%", row = "1" },
						size = function(state)
							local root_name = vim.fn.fnamemodify(state.path, ":~")
							local root_len = string.len(root_name) + 4
							return {
								width = math.max(root_len, 60),
								height = vim.o.lines - 0,
							}
						end,
					},
				},
			},
		})
	end,
})

use({
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			border = "single",
			auto_close = false,
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})
	end,
})

use({ "tpope/vim-surround" })

use({
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = { backdrop = 1 },
			plugins = {
				twilight = { enabled = true },
			},
		})
	end,
})

use({
	"folke/twilight.nvim",
	config = function()
		require("twilight").setup()
	end,
})

use({
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup()
	end,
})

use({
	"mvllow/modes.nvim",
	event = "BufRead",
	config = function()
		require("modes").setup({
			line_opacity = 0.3,
			focus_only = false,
		})
	end,
})

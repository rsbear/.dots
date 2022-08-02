local use = require("rs-utils").use

-- better buffer deleter
use("famiu/bufdelete.nvim")
-- disable search highlight on move
use({ "romainl/vim-cool" })
-- why not in vim core?
use({ "tpope/vim-surround" })

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
	branch = "v2.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require("neo-tree").setup({
			close_if_last_window = true,
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
				},
			},
			window = {
				position = "current",
				-- height = 100,
				-- width = 60,
			},
			filesystem = {
				filtered_items = { --These filters are applied to both browsing and searching
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						"node_modules",
						".git",
					},
				},
				follow_current_file = true,
				group_empty_dirs = false,
				use_libuv_file_watcher = true,
				hijack_netrw_behavior = "open_current",
				-- window = {
				-- 	position = "current",
				-- },
			},
			buffers = {
				follow_current_file = true,
				group_empty_dirs = false,
			},
			git_status = {
				window = {
					position = "float",
					mappings = {
						["A"] = "git_add_all",
						["u"] = "git_unstage_file",
						["a"] = "git_add_file",
						["r"] = "git_revert_file",
						["c"] = "git_commit",
						["p"] = "git_push",
						["gg"] = "git_commit_and_push",
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

use({
	"GustavoKatel/tasks.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		local source_npm = require("tasks.sources.npm")
		require("tasks").setup({
			sources = {
				npm = source_npm,
				utils = require("tasks.sources.builtin").new_builtin_source({
					sleep = {
						fn = function()
							local pasync = require("plenary.async")
							pasync.util.sleep(10000)
						end,
					},
				}),
			},
		})
	end,
})
require("telescope").load_extension("tasks")

use({
	"sidebar-nvim/sidebar.nvim",
	config = function()
		local tasks_section = require("sidebar-nvim.sections.tasks")
		require("sidebar-nvim").setup({
			side = "right",
			sections = { tasks_section, "git" },
		})
	end,
})

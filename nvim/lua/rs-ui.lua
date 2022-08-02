local use = require("rs-utils").use

use({ "lewis6991/impatient.nvim" })
use({ "nvim-lua/plenary.nvim", module = "plenary" })
use({ "nvim-lua/popup.nvim", module = "popup" })

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
				LineNr = { fg = "#3b384d" },
				CursorLineNr = { fg = "#9ccfd8" },
				GitSignsAdd = { fg = "#008D83" },
				-- GitSignsChange = { fg = '#f6c177' },
				-- IndentBlanklineChar = { fg = "#2c2a36" },
				IndentBlanklineChar = { fg = "#191724" },
				FloatBorder = { fg = "#2a273f", bg = "none" },
				-- bar bar
				BufferCurrent = { fg = "#ebbcba", bg = "#191724" },
				BufferCurrentMod = { fg = "#ebbcba", bg = "#191724" },
				BufferCurrentIcon = { fg = "#ebbcba", bg = "#191724" },
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
})

use({
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"dockerfile",
				"fish",
				"go",
				"gomod",
				"graphql",
				"html",
				"json",
				"json5",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"php",
				"phpdoc",
				"prisma",
				"scss",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			highlight = {
				enable = true,
			},
			auto_install = true,
			indent = { enable = true },
			autopairs = { enable = true },
			autotag = { enable = true },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
				config = {
					javascript = {
						__default = "// %s",
						jsx_element = "{/* %s */}",
						jsx_fragment = "{/* %s */}",
						jsx_attribute = "// %s",
						comment = "// %s",
					},
				},
			},
			textsubjects = {
				enable = true,
				prev_selection = ",", -- (Optional) keymap to select the previous selection
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
					["i;"] = "textsubjects-container-inner",
				},
			},
		})
	end,
	requires = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"windwp/nvim-ts-autotag",
	},
})

use({
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("indent_blankline").setup({ filetype_exclude = { "dashboard" } })
	end,
})

use({ "glepnir/dashboard-nvim" })
local dash = require("dashboard")

dash.preview_file_height = 12
dash.preview_file_width = 80

dash.custom_center = {
	{
		icon = "  ",
		desc = "finder                           ",
		shortcut = "~",
		action = "Telescope find_files find_command=rg,--hidden,--files",
	},
	{
		icon = "  ",
		desc = "notes                            ",
		shortcut = "~",
		action = ":e ~/Documents/vimnotes.md",
	},
	{
		icon = "  ",
		desc = "dots                             ",
		shortcut = "~",
		action = "Telescope find_files cwd=~/.config",
	},
	{
		icon = "  ",
		desc = "exit                             ",
		shortcut = "~",
		action = "qa",
	},
}

local function make_custom_footer()
	local default_footer = { "", "Have fun with neovim" }
	if packer_plugins ~= nil then
		local count = #vim.tbl_keys(packer_plugins)
		default_footer[2] = "loaded " .. count .. " plugins"
	end
	return default_footer
end

dash.custom_footer = make_custom_footer

dash.custom_header = {
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[   ▄████▄              ▒▒▒▒▒   ]],
	[[  ███▄█▀              ▒ ▄▒ ▄▒  ]],
	[[ ▐████     █  █  █   ▒▒▒▒▒▒▒▒▒ ]],
	[[  █████▄             ▒▒▒▒▒▒▒▒▒ ]],
	[[   ▀████▀            ▒ ▒ ▒ ▒ ▒ ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
	[[                               ]],
}
-- dash.custom_header = {
-- 	[[                                        ]],
-- 	[[                                        ]],
-- 	[[      __________________,............., ]],
-- 	[[     /_/_/_/_/_/_/_/_/,-',  ,. -,-,--/| ]],
-- 	[[    /_/_/_/_/_/_/_/,-' //  /-| / /--/ / ]],
-- 	[[   /_/_/_/_/_/_/,-' `-''--'  `' '--/ /  ]],
-- 	[[  /_/_/_/_/_/_,:................../ /   ]],
-- 	[[  |________,'                   hh|/    ]],
-- 	[[                                        ]],
-- 	[[                                        ]],
-- }

local hi = vim.api.nvim_set_hl

-- git gutter theme
-- hi(0, "GitSignsAdd", { fg = "#008D83", bg = "none" })
hi(0, "GitGutterChange", { fg = "#845ec2", bg = "none" })
-- hi(0, "DiffDelete", { fg = "#f0a0c0", bg = "#333333" })

hi(0, "DashboardHeader", { fg = "#ebbcba", bg = "none" }) -- rose pine, rose
hi(0, "DashboardCenter1Icon", { fg = "#696778", bg = "none" })
hi(0, "DashboardCenter3Icon", { fg = "#696778", bg = "none" })
hi(0, "DashboardCenter5Icon", { fg = "#696778", bg = "none" })
hi(0, "DashboardCenter7Icon", { fg = "#696778", bg = "none" })
hi(0, "DashboardShortCut", { fg = "#696778", bg = "none" })
hi(0, "DashboardFooter", { fg = "#696778", bg = "none" })
hi(0, "TelescopeBorder", { fg = "#ea9a97", bg = "none" })
hi(0, "TelescopePromptBorder", { fg = "#2a273f", bg = "none" })
hi(0, "TelescopeResultsBorder", { fg = "#2a273f", bg = "none" })
hi(0, "TelescopePreviewBorder", { fg = "#2a273f", bg = "none" })
hi(0, "TelescopeMatching", { fg = "#ea9a97", bg = "none" })
hi(0, "TelescopeNormal", { fg = "#9F9ABA", bg = "none" })

-- search and replace border and lsp float, covered in rose pine setup
-- hi(0, "FloatBorder", { fg = "#008D83", bg = "#1F1D2F" })

-- neotree border
hi(0, "NeoTreeBorder", { fg = "#ea9a97", bg = "none" })
hi(0, "NeoTreeFloatBorder", { fg = "#2a273f", bg = "#191724" })

-- barbar colors
-- hi(0, "BarbarStatusLine", { fg = "#696778", bg = "none" })
-- hi(0, "BarbarStatusLineFocused", { fg = "#696778", bg = "none" })
-- hi(0, "BarbarStatusLineSelected", { fg = "#696778", bg = "none" })
hi(0, "BarbarCurrentIcon", { fg = "#191724", bg = "#ebbcba" })

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

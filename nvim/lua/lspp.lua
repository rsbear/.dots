local use = require("rs-utils").use

-- haha uh oh
-- use({ "github/copilot.vim" })

use({ "folke/lsp-colors.nvim" })

use {
	"neovim/nvim-lspconfig",
	requires = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("lsp").init()
	end,
}

use {
	"mhartington/formatter.nvim",
	config = function()
		require('formatter').setup({
			filetype = {
				typescript = {
					function()
						return {
							exe = "prettierd",
							args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
							-- args = {
							-- 	"fmt",
							-- 	"--config",
							-- 	"~/.config/dprint/dprint.json",
							-- 	"--stdin",
							-- 	vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
							-- },
							stdin = true
						}
					end
				},
				typescriptreact = {
					function()
						return {
							exe = "prettierd",
							args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
							-- args = {
							-- 	"fmt",
							-- 	"--config",
							-- 	"~/.config/dprint/dprint.json",
							-- 	"--stdin",
							-- 	vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
							-- },
							stdin = true
						}
					end
				},
			}
		})
	end
}

use({ "RishabhRD/popfix" })
use({ "RishabhRD/nvim-lsputils" })

use("ray-x/go.nvim")
use("ray-x/guihua.lua")

use({
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			position = "right", -- position of the list can be: bottom, top, left, right
			width = 50,
			signs = {
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "﫠",
			},
		})
	end,
})

-- use({ "simrat39/symbols-outline.nvim" })
-- vim.g.symbols_outline = {
-- 	width = 40,
-- 	symbols = {
-- 		Constant = { icon = "", hl = "TSConstant" },
-- 		Function = { icon = "", hl = "TSFunction" },
-- 		Method = { icon = "", hl = "TSMethod" },
-- 		Variable = { icon = "", hl = "TSVariable" },
-- 	},
-- }

-- use({
-- 	"edgedb/edgedb-vim",
-- })


use({
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
			auto_select = true, -- automatically select the first item
			insert = false, -- use insert confirm behavior instead of replace
			map_char = { -- modifies the function or method delimiter by filetypes
				all = "(",
				tex = "{",
			},
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
		})
	end,
})

use({
	"numToStr/Comment.nvim",
	requires = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("Comment").setup({

			-- handle tsx
			pre_hook = function(ctx)
				-- Only calculate commentstring for tsx filetypes
				if vim.bo.filetype == "typescriptreact" then
					local U = require("Comment.utils")

					-- Determine whether to use linewise or blockwise commentstring
					local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

					-- Determine the location where to calculate commentstring from
					local location = nil
					if ctx.ctype == U.ctype.blockwise then
						location = require("ts_context_commentstring.utils").get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require("ts_context_commentstring.utils").get_visual_start_location()
					end

					return require("ts_context_commentstring.internal").calculate_commentstring({
						key = type,
						location = location,
					})
				end
			end,
		})
	end,
})

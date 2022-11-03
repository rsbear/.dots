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
							exe = "dprint",
							args = {
								"fmt",
								"--config",
								"~/.config/dprint/dprint.json",
								"--stdin",
								vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
							},
							stdin = true
						}
					end
				},
				typescriptreact = {
					function()
						return {
							exe = "dprint",
							args = {
								"fmt",
								"--config",
								"~/.config/dprint/dprint.json",
								"--stdin",
								vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
							},
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

-- use({
-- 	"glepnir/lspsaga.nvim",
-- 	branch = "main",
-- 	config = function()
-- 		require("lspsaga").init_lsp_saga({
-- 			border_style = "rounded",
-- 			code_action_icon = "",
-- 			code_action_lightbulb = {
-- 				enable = false,
-- 				sign = true,
-- 			},
-- 		})
-- 	end,
-- })

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

use({ "simrat39/symbols-outline.nvim" })
vim.g.symbols_outline = {
	width = 40,
	symbols = {
		Constant = { icon = "", hl = "TSConstant" },
		Function = { icon = "", hl = "TSFunction" },
		Method = { icon = "", hl = "TSMethod" },
		Variable = { icon = "", hl = "TSVariable" },
	},
}

use({
	"edgedb/edgedb-vim",
})

use({
	"L3MON4D3/LuaSnip",
	config = function()
		local ls = require("luasnip")
		-- some shorthands...
		local s = ls.snippet
		local i = ls.insert_node
		local ps = ls.parser.parse_snippet
		local rep = require("luasnip.extras").rep
		local fmt = require("luasnip.extras.fmt").fmt

		-- Every unspecified option will be set to the default.
		ls.config.set_config({
			history = true,
			update_events = "TextChanged,TextChangedI",
			delete_check_events = "TextChanged",
		})

		ls.add_snippets("typescript", {
			ps("impor", 'import {$0} from "$1";'),
			ps("fn", "function $1($2) {\n $0\n}"),
			ps("fun", "function $1($2) {\n $0\n}"),
			ps("func", "function $1($2) {\n $0\n}"),
			ps("fna", "async function $1($2) {\n $0\n}"),
			ps("arrow", "const $1 = ($2) => {\n $0\n}"),
			ps("arrowa", "const $1 = async ($2) => {\n $0\n}"),
			ps("cb", "($1) => $0"),
			ps("inter", "interface $1 {\n$0\n}"),
			-- ps('clg', "console.log('$1 --', $1);$0"),
			ps("state", "const [$1, $2] = useState($0);"),
			ps("useeffect", "useEffect(() => {\n  $0\n}, [])"),
			s("clg", fmt("console.log('{}', {})", { rep(1), i(1) })),
		})

		ls.add_snippets("typescriptreact", {
			ps("impor", 'import {$0} from "$1";'),
			ps("fn", "function $1($2) {\n $0\n}"),
			ps("fun", "function $1($2) {\n $0\n}"),
			ps("func", "function $1($2) {\n $0\n}"),
			ps("fna", "async function $1($2) {\n $0\n}"),
			ps("arrow", "const $1 = ($2) => {\n $0\n}"),
			ps("arrowa", "const $1 = async ($2) => {\n $0\n}"),
			ps("cb", "($1) => $0"),
			-- ps('clg', "console.log('$1 --', $2);$0"),
			ps("inter", "interface $1 {\n$0\n}"),
			ps("state", "const [$1, $2] = useState($0);"),
			ps("useeff", "useEffect(() => {\n  $1\n}, [$0])"),
			ps("div", "<div>\n$0\n</div>"),
			ps("divc", '<div className="$1">\n$0\n</div>'),
			ps("h1", "<h1>$0</h1>"),
			ps("h1c", '<h1 className="$1">$0</h1>'),
			ps("h2", "<h2>$0</h2>"),
			ps("h3", "<h3>$0</h3>"),
			ps("h4", "<h4>$0</h4>"),
			ps("h5", "<h5>$0</h5>"),
			ps("h6", "<h6>$0</h6>"),
			ps("p", "<p>$0</p>"),
			ps("span", "<span>$0</span>"),
			ps("input", '<input className="$1" placeholder="$2" onChange={$0} />'),
			ps("button", '<button type="button" className="$1" onClick={$2}>$0</button>'),
			ps("class", 'className="$0"'),
			ps(
				"rfc",
				'import type { FC } from "react"\n\nexport const $1:FC = () => {\n  return(\n    <div>\n$0\n</div>)}\n'
			),
			ps(
				"rcc",
				'export default function $1($2) {\n\n  return(\n    <div>\n$0\n    </div>\n  )\n}'
			),
			ps(
				"rfp",
				'import type { NextPage } from "next"\n\nconst $1:NextPage = () => {\n  return(\n    <div>\n$0\n</div>)}\n\nexport default $2'
			),
			ps(
				"gssp",
				'export const getServerSideProps: GetServerSideProps = async (ctx) => {\n  return {\n    props: {}  \n  }\n}\n\n'
			),
			s("clg", fmt("console.log('{}', {})", { rep(1), i(1) })),
		})
	end,
})

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

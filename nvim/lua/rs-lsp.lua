local use = require("rs-utils").use

-- haha uh oh
use({ "github/copilot.vim" })

use({ "folke/lsp-colors.nvim" })

use({
	"neovim/nvim-lspconfig",
	requires = {
		"williamboman/nvim-lsp-installer",
		-- 'ray-x/lsp_signature.nvim',
	},
	config = require("lsp"),
})

use({ "RishabhRD/popfix" })
use({ "RishabhRD/nvim-lsputils" })

use("ray-x/go.nvim")
use("ray-x/guihua.lua")

use({
	"glepnir/lspsaga.nvim",
	branch = "main",
	config = function()
		require("lspsaga").init_lsp_saga({
			border_style = "rounded",
			code_action_icon = "",
			code_action_lightbulb = {
				enable = false,
				sign = true,
			},
		})
	end,
})

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
			ps("func", "function $1($2) {\n $0\n}"),
			ps("cb", "($1) => $0"),
			ps("inter", "interface $1 {\n$0\n}"),
			-- ps('clg', "console.log('$1 --', $1);$0"),
			ps("state", "const [$1, $2] = useState($0);"),
			ps("useeff", "useEffect(() => {\n  $0\n}, [])"),
			s("clg", fmt("console.log('{}', {})", { rep(1), i(1) })),
		})

		ls.add_snippets("typescriptreact", {
			ps("impor", 'import {$0} from "$1";'),
			ps("fun", "function $1($2) {\n $0\n}"),
			ps("func", "function $1($2) {\n $0\n}"),
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
			ps("button", '<button className="$1" onClick={$2} type="button">$0</button>'),
			ps(
				"rfc",
				'import { FC } from "react"\n\nconst $1:FC = () => {\n  return(\n    <div>\n$0\n</div>)}\n\nexport default $2'
			),
			s("clg", fmt("console.log('{}', {})", { rep(1), i(1) })),
		})
	end,
})

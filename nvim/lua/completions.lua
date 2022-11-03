local use = require("rs-utils").use

use({ "saadparwaiz1/cmp_luasnip" })

-- use({
-- 	branch = "coq",
-- 	"ms-jpq/coq_nvim",
-- })

use {
  "zbirenbaum/copilot.lua",
  event = "VimEnter",
  config = function()
    vim.defer_fn(function()
      require("copilot").setup({
				server_opts_overrides = {
					trace = "verbose",
					settings = {
						advanced = {
							listCount = 10, -- #completions for panel
							inlineSuggestCount = 3, -- #completions for getCompletions
							indentationMode = {
								typescript = "client",
								javascript = "client",
							}
						}
					},
				}
			})
    end, 100)
  end,
}

use {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function ()
    require("copilot_cmp").setup({
			method = "getCompletionsCycling",
			formatters = {
				label = require("copilot_cmp.format").format_label_text,
				insert_text = require("copilot_cmp.format").format_insert_text,
				preview = require("copilot_cmp.format").deindent,
			},
		})
  end
}

use({
	"hrsh7th/nvim-cmp",
	requires = {
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local icons = {
			Text = " ",
			Method = " ",
			Function = " ",
			Constructor = "⌘ ",
			Field = "ﰠ ",
			Variable = " ",
			Class = "ﴯ",
			Interface = " ",
			Module = " ",
			Property = "ﰠ ",
			Unit = "塞 ",
			Value = " ",
			Enum = " ",
			Keyword = "廓 ",
			Snippet = " ",
			Color = " ",
			File = " ",
			Reference = " ",
			Folder = " ",
			EnumMember = " ",
			Constant = " ",
			Struct = "פּ ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		}

		cmp.setup({
			window = { -- rounded border; thin-style scrollbar
				completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ 
					select = false, -- was true before copilot cmp
		      behavior = cmp.ConfirmBehavior.Replace,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "copilot", group_index = 1 },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
		    -- insert_text = require("copilot_cmp.format").remove_existing,
				format = function(_, vim_item)
					vim_item.menu = vim_item.kind
					vim_item.kind = icons[vim_item.kind]

					return vim_item
				end,
			},
		})
	end,
})

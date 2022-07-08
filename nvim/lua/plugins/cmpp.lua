return function()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local luasnip = require("luasnip")

	local icons = {
		Text = " ",
		Method = " ",
		Function = " ",
		Constructor = "⌘ ",
		Field = "ﰠ ",
		Variable = " ",
		Class = "ﴯ" ,
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
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-q>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
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
			{ name = "nvim_lsp", group_index = 2 },
			-- { name = "copilot", group_index = 2 },
			{ name = "luasnip", group_index = 1 },
			{ name = "buffer", group_index = 3 },
			{ name = "path", group_index = 4 },
		}),
		{
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(_, vim_item)
				vim_item.menu = vim_item.kind
				vim_item.kind = icons[vim_item.kind]

				return vim_item
			end,
		},
	})
end

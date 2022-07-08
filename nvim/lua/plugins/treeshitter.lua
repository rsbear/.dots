return function()
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
end

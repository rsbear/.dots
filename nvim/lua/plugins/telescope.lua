return function()
	local telescope = require("telescope")
	local trouble = require("trouble.providers.telescope")

	telescope.setup({
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
			git_status = { theme = "ivy", shorten_path = true },
			live_grep = { theme = "ivy" },
			buffers = { theme = "dropdown" },
			find_files = { theme = "dropdown", previewer = false },
		},
	})
end

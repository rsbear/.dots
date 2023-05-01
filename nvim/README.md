## Deprecated configs
```lua
use({
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				icons_enabled = false,
				theme = "rose-pine",
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				disabled_filetypes = { "dashboard", "packer" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				-- lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp' } } },
				lualine_c = {
					{
						"filename",
						file_status = false, -- Displays file status (readonly status, modified status)
						path = 1,
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
})

use({
	"ziontee113/color-picker.nvim",
	config = function()
   require("color-picker").setup({})
	end,
})
```

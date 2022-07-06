local M = {}

function M.indentline()
	require("indent_blankline").setup({ filetype_exclude = { "dashboard" } })
end

function M.hop()
	require("hop").setup()
end

function M.modes()
	return function()
		require("modes").setup({
			line_opacity = 0.3,
			focus_only = false,
		})
	end
end

function M.git()
	return function()
		require("git").setup({
			keymaps = {
				blame = "<leader>gb",
				browse = "<leader>go",
			},
		})
	end
end

function M.whichkey()
	return function()
		require("which-key").setup({
			plugins = {
				presets = {
					-- Disable operators
					operators = false,
				},
			},
		})
	end
end

return M

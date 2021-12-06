return function()
	require("Comment").setup({
		toggler = {
			---line-comment keymap
			line = "gcc",
			---block-comment keymap
			block = "gbc",
		},
	})
end

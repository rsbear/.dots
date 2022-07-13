return function()
	require("bufferline").setup({
		--   animation = false,
		--   closable = true,
		clickable = false,
		--   icons = false,
		--   icon_separator_active = '',
		icon_separator_inactive = "",
		icon_close_tab = "",
		icon_close_tab_modified = "",
		--   icon_pinned = '',
		insert_at_end = true,
		insert_at_start = false,
		maximum_padding = 0,
		no_name_title = nil,
	})
end

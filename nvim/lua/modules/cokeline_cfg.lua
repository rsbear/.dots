return function()
	local cokeline = require("cokeline")
	local get_hex = require("cokeline.utils").get_hex

	local space = function()
		-- return " " .. buffer.devicon.icon
		return "  "
	end

	local fg = function(buffer)
		if buffer.is_focused then
			return get_hex("Normal", "fg")
		end
		return "#6b8093"
	end

	local filename = function(buffer)
		return buffer.filename
	end

	local underline = function()
		-- if buffer.is_focused then
		-- 	return "underline"
		-- end
		return nil
	end

	cokeline.setup({
		default_hl = {
			focused = {
				fg = get_hex("Normal", "fg"),
				bg = "#3a405e",
			},
			unfocused = {
				fg = "#6b8093",
				bg = "NONE",
			},
		},
		components = {
			{
				text = space,
				hl = { fg = fg },
			},
			{
				text = function(buffer)
					return buffer.unique_prefix
				end,
				hl = {
					fg = function(buffer)
						return buffer.is_focused and get_hex("Normal", "fg") or "#6b8093"
					end,
					style = "italic",
				},
			},
			{
				text = filename,
				hl = { fg = fg, style = underline },
			},
			{
				text = space,
				hl = { fg = fg },
			},
		},
		{
			text = " ",
		},
		{
			text = "",
			delete_buffer_on_left_click = false,
		},
		{
			text = " ",
		},
	})
end

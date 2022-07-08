return function()
	local saga = require("lspsaga")
	saga.init_lsp_saga({
		border_style = "rounded",
		code_action_icon = "",
		code_action_lightbulb = {
			enable = false,
			sign = true,
		},
	})
end

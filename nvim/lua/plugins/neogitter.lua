return function()
	local neo = require("neogit")

	neo.setup({
		disable_signs = false,
		disable_hint = false,
		disable_context_highlighting = false,
		disable_commit_confirmation = true,
		auto_refresh = true,
		disable_builtin_notifications = false,
		integrations = {
			diffview = false,
		},
		signs = {
			-- { CLOSED, OPENED }
			section = { "", "" },
			item = { "", "絛" },
			hunk = { "", "" },
		},
		sections = {
			unpulled = {
				folded = true,
			},
			unmerged = {
				folded = false,
			},
			recent = {
				folded = true,
			},
		},
		mappings = {
			status = {
				-- Adds a mapping with "B" as key that does the "BranchPopup" command
				["B"] = "BranchPopup",
				-- Removes the default mapping of "s"
				["<leader>q"] = "Close",
			},
		},
	})
end

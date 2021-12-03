local M = {}

local function symbols_override()
	local diagnostic_signs = { Error = "", Warning = "", Hint = "", Information = "" }
	for type, icon in pairs(diagnostic_signs) do
		local hl = "LspDiagnosticsSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

local function disable_virtual_text()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = false }
	)
end

function M.setup()
	disable_virtual_text()
	symbols_override()
end

return M

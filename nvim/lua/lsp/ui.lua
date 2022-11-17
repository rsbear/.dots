local export = {}

local function disable_virtual_text()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = false }-- false to hide lsp ghost text
	)
end

local function hover_doc_style()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
end

local function code_action_style()
	vim.lsp.handlers["textDocument/codeActions"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
end

function export.setup()
	disable_virtual_text()
	hover_doc_style()
	code_action_style()
	-- vim.cmd([[COQnow]])
end

return export

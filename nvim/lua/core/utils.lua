local M = {}

function P(cmd)
	print(vim.inspect(cmd))
end

function _G.safe_require(module)
	local ok, result = pcall(require, module)
	if not ok then
		vim.notify(string.format("Error requiring: %s", module), vim.log.levels.ERROR)
		return ok
	end
	return result
end

-- Os
M.os = {
	home = os.getenv("HOME"),
	data = vim.fn.stdpath("data"),
	cache = vim.fn.stdpath("cache"),
	config = vim.fn.stdpath("config"),
	name = vim.loop.os_uname().sysname,
	is_git_dir = os.execute("git rev-parse --is-inside-work-tree >> /dev/null 2>&1"),
}

function _G.organize_golang_imports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit)
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

-- Mappings
M.keymap = {}
function M.keymap.buf_map(mode, key, cmd, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_buf_set_keymap(0, mode, key, cmd, options)
end

function M.keymap.map(mode, key, cmd, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, key, cmd, options)
end

return M

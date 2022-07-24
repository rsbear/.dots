local function lspmap(key, cmd, opts)
	vim.keymap.set("n", key, "<cmd>lua " .. cmd .. "<CR>", opts)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/codeActions"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
-- local util = require("vim.lsp.util")
-- vim.lsp.handlers["textDocument/definition"] = function(_, result, params)
-- 	if result == nil or vim.tbl_isempty(result) then
-- 		local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, "No location found")
-- 		return nil
-- 	end
--
-- 	print(result)
-- 	if vim.tbl_islist(result) then
-- 		vim.lsp.util.jump_to_location(result[1])
-- 		if #result > 1 then
-- 			local isReactDTs = false
-- 			for key, value in pairs(result) do
-- 				if string.match(value.uri, "react/index.d.ts") then
-- 					isReactDTs = true
-- 					break
-- 				end
-- 			end
-- 			if not isReactDTs then
-- 				vim.fn.setqflist(vim.lsp.util.locations_to_items(result))
-- 				vim.api.nvim_command("copen")
-- 			end
-- 		end
-- 	else
-- 		vim.lsp.util.jump_to_location(result)
-- 	end
-- end

return function(client)
	vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
	-- LSP
	lspmap("K", "vim.lsp.buf.type_definition()")
	lspmap("gd", "vim.lsp.buf.definition()")
	lspmap("gD", "vim.lsp.buf.declaration()")
	lspmap("gi", "vim.lsp.buf.implementation()")
	lspmap("<leader>e", 'vim.diagnostic.open_float({ border = "rounded" })')
	lspmap("<leader>gh", "vim.lsp.buf.signature_help()")
	lspmap("<leader>rn", "vim.lsp.buf.rename()")
	lspmap("<leader>[", 'vim.diagnostic.goto_prev({ border = "rounded" })')
	lspmap("<leader>]", 'vim.diagnostic.goto_next({ border = "rounded" })')
	lspmap("<leader>n", "vim.lsp.buf.signature_help()")
	-- lspmap("?", "vim.lsp.buf.hover()")
	vim.keymap.set("n", "?", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
	vim.keymap.set("n", "gp", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

	local action = require("lspsaga.action")
	-- scroll down hover doc or scroll in definition preview
	vim.keymap.set("n", "<C-f>", function()
		action.smart_scroll_with_saga(1)
	end, { silent = true })
	-- scroll up hover doc
	vim.keymap.set("n", "<C-b>", function()
		action.smart_scroll_with_saga(-1)
	end, { silent = true })

	-- So that the only client with format capabilities is efm
	if client.name ~= "efm" then
		client.resolved_capabilities.document_formatting = false
	end

	if client.name == "gopls" then
		client.resolved_capabilities.document_formatting = true
	end

	if client.name == "svelte" then
		client.resolved_capabilities.document_formatting = true
	end

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- vim.cmd 'autocmd BufWritePre silent exec "!dprint fmt"'
		-- vim.cmd ':silent exec "!dprint fmt"'
		-- vim.cmd 'autocmd BufWritePre silent exec "!yarn run format"'
		-- vim.cmd ':silent exec "!yarn run format"'
	end
end

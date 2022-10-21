local function lspmap(key, cmd, opts)
	vim.keymap.set("n", key, "<cmd>lua " .. cmd .. "<CR>", opts)
end

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
	lspmap("<leader>ca", "vim.lsp.buf.code_action()")
	lspmap("?", "vim.lsp.buf.hover()")


	-- So that the only client with format capabilities is efm
	if client.name ~= "efm" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "gopls" then
		client.server_capabilities.document_formatting = true
	end

	if client.name == "svelte" then
		client.server_capabilities.document_formatting = true
	end

	-- if client.name == "tsserver" then
	-- 	 vim.cmd 'autocmd BufWritePre silent execute "!dprint fmt --config ~/.config/dprintcfg/config.json"'
	-- end
	--
	-- if client.name == "denols" then
	-- 	 vim.cmd 'autocmd BufWritePre silent execute "!dprint fmt --config ~/.config/dprintcfg/config.json"'
	-- end

	if client.server_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- vim.cmd 'autocmd BufWritePre silent exec "!dprint fmt"'
		-- vim.cmd ':silent exec "!dprint fmt"'
		-- vim.cmd 'autocmd BufWritePre silent exec "!yarn run format"'
		-- vim.cmd ':silent exec "!yarn run format"'
	end

	-- vim.g.coq_settings = {auto_start = true}
	-- vim.cmd("COQnow -s")
end

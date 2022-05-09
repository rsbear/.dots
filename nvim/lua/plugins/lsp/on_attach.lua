local function lsp_nmap(key, cmd, opts)
  require('core.utils').keymap.buf_map('n', key, '<cmd>lua ' .. cmd .. '<CR>', opts)
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
vim.lsp.handlers['textDocument/codeActions'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

return function(client, bufnr)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  lsp_nmap('K', 'vim.lsp.buf.type_definition()')
  lsp_nmap('?', 'vim.lsp.buf.hover()')
  lsp_nmap('gd', 'vim.lsp.buf.definition()')
  lsp_nmap('gD', 'vim.lsp.buf.declaration()')
  lsp_nmap('gi', 'vim.lsp.buf.implementation()')
  lsp_nmap('<leader>e', 'vim.diagnostic.open_float({ border = "rounded" })')
  lsp_nmap('<leader>ca', 'vim.lsp.buf.code_action()')
  lsp_nmap('<leader>gh', 'vim.lsp.buf.signature_help()')
  lsp_nmap('<leader>rn', 'vim.lsp.buf.rename()')
  lsp_nmap('<leader>[', 'vim.lsp.diagnostic.goto_prev({ border = "rounded" })')
  lsp_nmap('<leader>]', 'vim.lsp.diagnostic.goto_next({ border = "rounded" })')
  lsp_nmap('<leader>n', 'vim.lsp.buf.signature_help()')

  -- DEPRECATE, idk not really loving this plugin
  -- local lsp_signature = require 'lsp_signature'
  -- if lsp_signature then
  -- lsp_signature.on_attach(cfg, bufnr)
  -- end

  -- So that the only client with format capabilities is efm
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.name == 'gopls' then
    client.resolved_capabilities.document_formatting = true
  end

  if client.name == 'svelte' then
    client.resolved_capabilities.document_formatting = true
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
    -- vim.cmd 'autocmd BufWritePre silent exec "!dprint fmt"'
    -- vim.cmd ':silent exec "!dprint fmt"'
    -- vim.cmd 'autocmd BufWritePre silent exec "!yarn run format"'
    -- vim.cmd ':silent exec "!yarn run format"'
  end
end

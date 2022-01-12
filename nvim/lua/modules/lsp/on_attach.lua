local function lua_nmap(key, cmd, opts)
  require('core.utils').keymap.buf_map('n', key, '<cmd>lua ' .. cmd .. '<CR>', opts)
end

return function(client)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  lua_nmap('K', 'vim.lsp.buf.hover()')
  lua_nmap('?', 'vim.lsp.buf.hover()')
  lua_nmap('gd', 'vim.lsp.buf.definition()')
  lua_nmap('gD', 'vim.lsp.buf.declaration()')
  lua_nmap('gi', 'vim.lsp.buf.implementation()')
  lua_nmap('<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
  lua_nmap('<leader>ca', 'vim.lsp.buf.code_action()')
  lua_nmap('<leader>gh', 'vim.lsp.buf.signature_help()')
  lua_nmap('<leader>rn', 'vim.lsp.buf.rename()')
  lua_nmap('<leader>ty', 'vim.lsp.buf.type_definition()')
  lua_nmap('[d', 'vim.lsp.diagnostic.goto_prev()')
  lua_nmap(']d', 'vim.lsp.diagnostic.goto_next()')
  lua_nmap('<leader>n', 'vim.lsp.buf.signature_help()')

  -- DEPRECATE, idk not really loving this plugin
  -- local lsp_signature = require 'lsp_signature'
  -- if lsp_signature then
  -- lsp_signature.on_attach()
  -- end

  -- So that the only client with format capabilities is efm
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.name == 'svelte' then
    client.resolved_capabilities.document_formatting = true
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
    -- vim.cmd 'autocmd BufWritePre silent exec "!dprint fmt"'
    -- vim.cmd ':silent exec "!dprint fmt"'
  end
end

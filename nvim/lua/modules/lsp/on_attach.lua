local function lua_nmap(key, cmd, opts)
  require('core.utils').keymap.buf_map('n', key, '<cmd>lua ' .. cmd .. '<CR>', opts)
end

return function(client)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  lua_nmap('K', 'vim.lsp.buf.hover()')
  lua_nmap('gd', 'vim.lsp.buf.definition()')
  lua_nmap('gD', 'vim.lsp.buf.declaration()')
  lua_nmap('gi', 'vim.lsp.buf.implementation()')
  lua_nmap('gr', 'vim.lsp.buf.references()')
  lua_nmap('<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
  lua_nmap('<leader>ca', 'vim.lsp.buf.code_action()')
  lua_nmap('<leader>gh', 'vim.lsp.buf.signature_help()')
  lua_nmap('<leader>rn', 'vim.lsp.buf.rename()')
  lua_nmap('<leader>td', 'require"modules.lsp.ui".toggle_virtual_text()')
  lua_nmap('<leader>tt', 'vim.lsp.buf.type_definition()')
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

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
        augroup Format
          au! * <buffer>
          au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
      ]]
  end
end

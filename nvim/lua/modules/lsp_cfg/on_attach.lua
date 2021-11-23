local function buf_map(b, key, cmd)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(b, 'n', key, '<cmd>lua ' .. cmd .. '<CR>', opts)
end

return function(_)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  buf_map(0, 'gD', 'vim.lsp.buf.declaration()')
  buf_map(0, 'gd', 'vim.lsp.buf.definition()')
  buf_map(0, 'K', 'vim.lsp.buf.hover()')
  buf_map(0, 'gi', 'vim.lsp.buf.implementation()')
  buf_map(0, 'gr', 'vim.lsp.buf.references()')
  buf_map(0, '<leader>e', 'vim.lsp.diagnostic.show_line_diagnostics()')
  buf_map(0, '<leader>ca', 'vim.lsp.buf.code_action()')
  buf_map(0, '<leader>tt', 'vim.lsp.buf.type_definition()')
  buf_map(0, '<leader>rn', 'vim.lsp.buf.rename()')
  buf_map(0, '[d', 'vim.lsp.diagnostic.goto_prev()')
  buf_map(0, ']d', 'vim.lsp.diagnostic.goto_next()')
  buf_map(0, '<leader>q', 'vim.lsp.diagnostic.set_loclist()')
  -- buf_map(bufnr, '<leader>so', 'require('telescope.builtin').lsp_document_symbols()')
end

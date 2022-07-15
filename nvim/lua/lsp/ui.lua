local M = {}

local function disable_virtual_text()
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = false }
  )
end

function M.setup()
  disable_virtual_text()
end

return M

require 'modules._plugins'
require 'core.options'
require 'core.keymaps'
require 'core.autocommands'

-- cant get this to work unforunately but its important so keep here
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   { virtual_text = false, signs = true, underline = true, update_in_insert = true }
-- )

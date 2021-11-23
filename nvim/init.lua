require 'modules._plugins'
require('neoscroll').setup()
require 'core.options'
require 'core.keymaps'
require 'core.autocommands'

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   virtual_text = {
--     spacing = 5,
--     severity_limit = 'Warning',
--   },
--   update_in_insert = true,
-- })

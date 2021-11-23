local lsp = require 'lspconfig'
local on_attach = require 'modules.lsp_cfg.on_attach'

lsp.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  root_dir = lsp.util.root_pattern('.git', 'package.json'),
  settings = { documentFormatting = false },
  -- capabilities = capabilities,
}

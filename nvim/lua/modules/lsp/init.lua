return function()
  local lspconfig = require 'lspconfig'

  local on_attach = require 'modules.lsp.on_attach'
  local format_config = require 'modules.lsp.format'
  require('modules.lsp.ui').setup()

  local servers = {
    efm = {
      filetypes = vim.tbl_keys(format_config),
      -- filetypes = filetypes,
      init_options = { documentFormatting = true },
      root_dir = lspconfig.util.root_pattern { '.git/', '.' },
      settings = {
        languages = format_config,
        rootMarkers = { 'package.json' },
      },
    },
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    },
  }

  local function get_config(server_name)
    local config = servers[server_name] or {}
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if package.loaded['cmp_nvim_lsp'] then
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    end
    config.on_attach = on_attach

    return config
  end

  require('nvim-lsp-installer').on_server_ready(function(server)
    server:setup(get_config(server.name))
    -- vim.cd [[ do User LspAttachBuffers ]]
  end)
end

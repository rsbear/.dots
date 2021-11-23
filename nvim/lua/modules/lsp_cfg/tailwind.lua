local lsp = require 'lspconfig'
local on_attach = require 'modules.lsp_cfg.on_attach'

local function config(new_config)
  if not new_config.settings then
    new_config.settings = {}
  end
  if not new_config.settings.editor then
    new_config.settings.editor = {}
  end
  if not new_config.settings.editor.tabSize then
    -- set tab size for hover
    new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
  end
end

lsp.tailwindcss.setup {
  cmd = { 'tailwindcss-language-server', '--stdio' },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  filetypes = {
    'astro',
    'astro-markdown',
    'eelixir',
    'gohtml',
    'html',
    'markdown',
    'mdx',
    'twig',
    'css',
    'less',
    'postcss',
    'sass',
    'scss',
    'stylus',
    'sugarss',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'svelte',
  },
  on_new_config = config,
  root_dir = lsp.util.root_pattern(
    'tailwind.config.js',
    'tailwind.config.ts',
    'postcss.config.js',
    'postcss.config.ts',
    'package.json'
  ),
  settings = {
    tailwindCSS = {
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidConfigPath = 'error',
        invalidScreen = 'error',
        invalidTailwindDirective = 'error',
        invalidVariant = 'error',
        recommendedVariantOrder = 'warning',
      },
      validate = true,
    },
  },
}

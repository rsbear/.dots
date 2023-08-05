local export = {}

function export.init()
  local mason_lspconfig = require('mason-lspconfig')
  mason_lspconfig.setup({
    ensure_installed = {},
  })

  local lsp_opts = {
    on_attach = require('keymaps').lsp_on_attach,
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local function filter(arr, fn)
    if type(arr) ~= 'table' then
      return arr
    end

    local filtered = {}
    for k, v in pairs(arr) do
      if fn(v, k, arr) then
        table.insert(filtered, v)
      end
    end

    return filtered
  end

  local function filterReactDTS(value)
    return string.match(value.targetUri, 'react/index.d.ts') == nil
  end

  local function patch(result)
    if not vim.tbl_islist(result) or type(result) ~= 'table' then
      return result
    end

    -- if there is a second result return it
    if #result > 1 then
      return { result[2] }
    end

    return { result[1] }
  end

  local function handle_gtd(err, result, ctx, ...)
    vim.lsp.handlers['textDocument/definition'](err, patch(result), ctx, ...)
  end

  mason_lspconfig.setup_handlers({
    function(server_name)
      require('lspconfig')[server_name].setup(lsp_opts)
    end,
    -- ['lua_lsp'] = function()
    --   require('lspconfig').lua_lsp.setup(vim.tbl_deep_extend('force', lsp_opts, {
    --     settings = {
    --       Lua = {
    --         diagnostics = {
    --           globals = { 'vim' },
    --         },
    --       },
    --     },
    --   }))
    -- end,
    ['tailwindcss'] = function()
      require('lspconfig').tailwindcss.setup(vim.tbl_deep_extend('force', lsp_opts, {
        filetypes = { 'typescriptreact', 'astro', 'javascriptreact', 'svelte' },
        root_dir = require('lspconfig').util.root_pattern({ 'tailwind.config.js', 'tailwind.config.cjs', 'deno.json' }),
      }))
    end,
    ['denols'] = function()
      require('lspconfig').denols.setup(vim.tbl_deep_extend('force', lsp_opts, {
        root_dir = require('lspconfig').util.root_pattern({ 'deno.json', 'importMap.json', 'mod.ts' }),
      }))
    end,
    ['unocss'] = function()
      require('lspconfig').unocss.setup(vim.tbl_deep_extend('force', lsp_opts, {
        filetypes = { 'typescriptreact', 'astro', 'javascriptreact' },
        root_dir = require('lspconfig').util.root_pattern({
          'deno.json',
          'importMap.json',
          'mod.ts',
          'astro.config.mjs',
        }),
      }))
    end,
    ['cssls'] = function()
      require('lspconfig').cssls.setup(vim.tbl_deep_extend('force', lsp_opts, {
        capabilities = capabilities,
        settings = {
          css = {
            validate = true,
          },
          scss = {
            validate = true,
          },
        },
      }))
    end,
    -- ['tsserver'] = function()
    --   require('lspconfig').tsserver.setup(vim.tbl_deep_extend('force', lsp_opts, {
    --     root_dir = require('lspconfig').util.root_pattern({ 'package.json', 'yarn.lock', 'package-lock.json' }),
    --     settings = {
    --       update_on_insert = false,
    --     },
    --     handlers = {
    --       ['textDocument/definition'] = function(err, result, method, ...)
    --         if vim.tbl_islist(result) and #result > 1 then
    --           local filtered_result = filter(result, filterReactDTS)
    --           return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
    --         end
    --
    --         vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
    --       end,
    --     },
    --     -- handlers = {
    --     --   ['textDocument/definition'] = handle_gtd,
    --     -- },
    --   }))
    -- end,
    ['vtsls'] = function()
      require('lspconfig').vtsls.setup(vim.tbl_deep_extend('force', lsp_opts, {
        capabilities = capabilities,
      }))
    end,
  })
end

return export

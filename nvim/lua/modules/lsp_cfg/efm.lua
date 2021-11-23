local prettier = {
  formatCommand = './node_modules/.bin/prettier --find-config-path --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

local filetypes = {
  'css',
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx',
  'svelte',
  'lua',
  'json',
  'html',
  'scss',
}

local languages = {
  css = { prettier },
  graphql = { prettier },
  html = { prettier },
  javascript = { prettier },
  javascriptreact = { prettier },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier },
  typescriptreact = { prettier },
  ['typescript.tsx'] = { prettier },
  yaml = { prettier },
}

local format_async = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    -- if bufnr == vim.api.nvim_get_current_buf() then
    --   vim.api.nvim_command 'noautocmd :update'
    -- end
  end
end

local function efm_attach(client)
  vim.cmd 'command! LspFormatting lua vim.lsp.buf.formatting()'

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec(
      [[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]],
      true
    )
  end
end

vim.lsp.handlers['textDocument/formatting'] = format_async

require('lspconfig').efm.setup {
  on_attach = efm_attach,
  init_options = { documentFormatting = true },
  filetypes = filetypes,
  settings = {
    rootMarkers = { 'package.json' },
    languages = languages,
  },
  -- cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},
}

local prettier = {
  formatCommand = './node_modules/.bin/prettier --find-config-path --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

return {
  css = { prettier },
  graphql = { prettier },
  html = { prettier },
  javascript = { prettier },
  javascriptreact = { prettier },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  svelte = { prettier },
  typescript = { prettier },
  typescriptreact = { prettier },
  -- ['typescript.tsx'] = { prettier },
  -- yaml = { prettier },
}

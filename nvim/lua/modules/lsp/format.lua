local dprint = {
  formatCommand = 'dprint fmt --stdin ${INPUT}',
  formatStdin = true,
}

local prettier = {
  formatCommand = 'prettierd ${INPUT}',
  formatStdin = true,
}

local stylua = {
  formatCommand = 'stylua -s -',
  formatStdin = true,
}

local projectPathPrettier = {
  formatCommand = 'prettierd --stdin --config ${PROJECT_PATH}/.prettierrc.json',
  formatStdin = true,
}

return {
  css = { prettier },
  graphql = { prettier },
  javascript = { prettier },
  javascriptreact = { prettier },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier },
  typescriptreact = { prettier },
  -- ['typescript.tsx'] = { prettier },
  -- yaml = { prettier },
}

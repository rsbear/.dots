vim.api.nvim_exec(
  [[

 autocmd BufWritePre *.go lua organize_golang_imports(1000)

  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end

	autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
]],
  false
)

-- autocmd BufWritePre *.cs :lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier

-- augroup Packer
--   autocmd!
--   autocmd BufWritePost init.lua PackerCompile
-- augroup end

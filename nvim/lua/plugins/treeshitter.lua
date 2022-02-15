return function()
  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
      -- disable = { 'json' },
    },
    ensure_installed = 'maintained',
    indent = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
      config = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s',
        },
      },
    },
  }

  -- require('nvim-ts-autotag').setup({
  -- enable = true
  -- })
end

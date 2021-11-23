return function()
  local telescope = require 'telescope'
  local trouble = require 'trouble.providers.telescope'

  telescope.setup {
    defaults = {
      file_ignore_patterns = { 'node_modules', 'yarn.lock', 'yarn-error.log' },
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
          ['<c-t>'] = trouble.open_with_trouble,
        },
        n = {
          ['<c-t>'] = trouble.open_with_trouble,
        },
      },
    },
    -- pickers = {
    --   git_status = {
    --     theme = 'cursor',
    --   },
    -- },
  }
end

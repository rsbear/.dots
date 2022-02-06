return function()
  local signs = require 'gitsigns'

  signs.setup {
    signs = {
      add = { hl = 'GitSignsAdd', text = '│' },
      change = { hl = 'GitGutterChange', text = '│' },
      delete = { hl = 'GitGutterDelete', text = '_' },
      topdelete = { hl = 'GitGutterDelete', text = '‾' },
      changedelete = { hl = 'GitGutterChange', text = '~' },
    },
  }
end

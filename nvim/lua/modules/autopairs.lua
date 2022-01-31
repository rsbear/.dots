return function()
  local autopairs = require 'nvim-autopairs'

  autopairs.setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = true, -- automatically select the first item
    insert = false, -- use insert confirm behavior instead of replace
    map_char = { -- modifies the function or method delimiter by filetypes
      all = '(',
      tex = '{',
    },
    check_ts = true,
    ts_config = {
      lua = { 'string' }, -- it will not add a pair on that treesitter node
      javascript = { 'template_string' },
      java = false, -- don't check treesitter on java
    },
  }
end

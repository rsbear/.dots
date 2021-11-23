return function()
  local line = require 'lualine'

  line.setup {
    options = {
      icons_enabled = false,
      -- theme = vim.g.colors_name or 'auto',
      theme = 'auto',
      component_separators = { left = ' ', right = ' ' },
      section_separators = { left = ' ', right = ' ' },
      disabled_filetypes = { 'dashboard', 'NvimTree', 'packer' },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp' } } },
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

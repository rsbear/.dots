-- SET THE THEME IN THE CMD AT THE BOTTOM
-- tokyo night theme specific
-- vim.g.tokyonight_dark_sidebar = false
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_style = 'storm'

-- rose-pine specific
vim.g.rose_pine_variant = ''
vim.g.rose_pine_bold_vertical_split_line = false
vim.g.rose_pine_inactive_background = false
vim.g.rose_pine_disable_background = false
vim.g.rose_pine_disable_float_background = false
vim.g.rose_pine_disable_italics = false

-- vim.cmd([[colorscheme tokyonight]])
vim.cmd [[
colorscheme rose-pine
hi GitSignsAdd guibg=none guifg=#008D83 ctermbg=none
hi GitGutterChange guibg=none guifg=#845EC2 ctermbg=none
hi DiffDelete guibg=#333333 guifg=#f0a0c0 ctermbg=none

highlight TelescopeBorder         guifg=#ea9a97
highlight TelescopePromptBorder   guifg=#2a273f
highlight TelescopeResultsBorder  guifg=#2a273f
highlight TelescopePreviewBorder  guifg=#2a273f
highlight TelescopeMatching       guifg=#ea9a97
highlight TelescopeNormal       guifg=#9F9ABA

]]

-- kinda annoying that this is a vim global
-- instead of cfg but whatever
vim.g.bufferline = {
  closable = true,
  clickable = false,
  icons = false,

  icon_separator_active = '',
  icon_separator_inactive = '',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '',

  insert_at_end = false,
  insert_at_start = false,
}

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- SET THE THEME IN THE CMD AT THE BOTTOM
-- tokyo night theme specific
-- vim.g.tokyonight_dark_sidebar = false
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_style = 'storm'

-- vim.cmd([[colorscheme tokyonight]])
vim.cmd([[
" colorscheme rose-pine
" colorscheme substrata
" colorscheme nord

hi GitGutterChange guibg=none guifg=#ebbcba ctermbg=none
hi DiffDelete guibg=#333333 guifg=#f0a0c0 ctermbg=none

highlight TelescopeBorder         guifg=#ea9a97
highlight TelescopePromptBorder   guifg=#2a273f
highlight TelescopeResultsBorder  guifg=#2a273f
highlight TelescopePreviewBorder  guifg=#2a273f
highlight TelescopeMatching       guifg=#ea9a97
highlight TelescopeNormal         guifg=#9F9ABA


hi NeoTreeFloatBorder guifg=#2a273f guibg=#191724

" search and replace border
hi FloatBorder guifg=#ea9a97 guibg=none

 "more barbar
hi BufferOffset guifg=#2a273f guibg=none 
hi BufferTabpageFill guifg=#2a273f guibg=none
hi BufferCurrent guifg=#FF6F91 guibg=none

" damn i dont remember why i added this
" hi NonText guifg=bg

" hop colors
" hi HopNextKey guifg=#f7wf38
" hi HopNextKey1 guifg=#f7wf38
" hi HopNextKey2 guifg=#f7wf38
]])

-- kinda annoying that this is a vim global
-- instead of cfg but whatever
-- itss for barbar
-- vim.g.bufferline = {
--   animation = false,
--   closable = true,
--   clickable = false,
--   icons = false,
--
--   icon_separator_active = '',
--   icon_separator_inactive = '',
--   icon_close_tab = '',
--   icon_close_tab_modified = '',
--   icon_pinned = '',
--
--   insert_at_end = true,
--   insert_at_start = false,
-- }

-- this api is still only in nightly sadzone
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#008D83', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = '#845ec2', bg = 'red' })
-- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#f0a0c0', bg = '#333333' })

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

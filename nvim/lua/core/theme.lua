-- SET THE THEME IN THE CMD AT THE BOTTOM
-- tokyo night theme specific
-- vim.g.tokyonight_dark_sidebar = false
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_style = 'storm'

-- vim.cmd([[colorscheme tokyonight]])
vim.cmd([[
" colorscheme substrata

" hide tildes at end of buffer NOW IN OPTIONS
" hi EndOfBuffer guifg=#191724
]])

-- kinda annoying that this is a vim global
-- instead of cfg but whatever
-- itss for barbar
vim.g.bufferline = {
	clickable = false,
	icon_separator_inactive = "",
	icon_close_tab = "",
	icon_close_tab_modified = "",
	insert_at_end = true,
	insert_at_start = false,
	maximum_padding = 0.1,
}

local hi = vim.api.nvim_set_hl

-- git gutter theme
-- hi(0, "GitSignsAdd", { fg = "#008D83", bg = "none" })
hi(0, "GitGutterChange", { fg = "#845ec2", bg = "none" })
-- hi(0, "DiffDelete", { fg = "#f0a0c0", bg = "#333333" })

-- dashboard theme
hi(0, "DashboardHeader", { fg = "#ebbcba", bg = "none" }) -- rose pine, rose
hi(0, "DashboardCenterIcon", { fg = "#696778", bg = "none" })
hi(0, "DashboardShortCut", { fg = "#696778", bg = "none" })
hi(0, "DashboardFooter", { fg = "#696778", bg = "none" })

-- telescope colors
hi(0, "TelescopeBorder", { fg = "#ea9a97", bg = "none" })
hi(0, "TelescopePromptBorder", { fg = "#2a273f", bg = "none" })
hi(0, "TelescopeResultsBorder", { fg = "#2a273f", bg = "none" })
hi(0, "TelescopePreviewBorder", { fg = "#2a273f", bg = "none" })
hi(0, "TelescopeMatching", { fg = "#ea9a97", bg = "none" })
hi(0, "TelescopeNormal", { fg = "#9F9ABA", bg = "none" })

-- search and replace border and lsp float, covered in rose pine setup
-- hi(0, "FloatBorder", { fg = "#008D83", bg = "#1F1D2F" })

-- neotree border
hi(0, "NeoTreeBorder", { fg = "#ea9a97", bg = "none" })
hi(0, "NeoTreeFloatBorder", { fg = "#2a273f", bg = "#191724" })

-- barbar colors
-- hi(0, "BarbarStatusLine", { fg = "#696778", bg = "none" })
-- hi(0, "BarbarStatusLineFocused", { fg = "#696778", bg = "none" })
-- hi(0, "BarbarStatusLineSelected", { fg = "#696778", bg = "none" })

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

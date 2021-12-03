local o = vim.o

o.completeopt = "menuone,noinsert,noselect"
o.inccommand = "nosplit"

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

o.hlsearch = true
o.hidden = true
o.mouse = "a"
o.breakindent = true
o.updatetime = 100
o.ignorecase = true
o.smartcase = true
o.termguicolors = true

-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0

vim.wo.number = true
vim.wo.signcolumn = "yes"

-- tokyo night theme specific
vim.g.tokyonight_dark_sidebar = false

vim.cmd([[set undofile]])
vim.cmd([[colorscheme tokyonight]])
-- vim.g.tokyonight_style = 'night'

-- fugitive husky fix
vim.g.fugitive_pty = 0

-- disable Tab copilot completion, see mapping in keymaps.lua
vim.g.copilot_no_tab_map = true

o.shortmess = o.shortmess .. "A"

-- Concat values to line above
-- o.shortmess = o.shortmess
--   + {
--     A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
--     I = true, -- don't give the intro message when starting Vim |:intro|.
--     W = true, -- don't give "written" or "[w]" when writing a file
--     c = true, -- don't give |ins-completion-menu| messages
--     m = true, -- use "[+]" instead of "[Modified]"
--   }

local utils = require("core.utils")
local map = utils.keymap.map

-- MAP SPACE TO LEADER
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function telemap(key, cmd)
	map("n", key, '<cmd>lua require("telescope.builtin").' .. cmd .. "<CR>")
end

local function troublemap(key, cmd)
	map("n", key, "<cmd>Trouble " .. cmd .. "<CR>")
end

-- TELESCOPE
telemap("<C-p>", "find_files()")
telemap("<leader>ff", "git_files()")
telemap("<leader>fb", "current_buffer_fuzzy_find()")
telemap("<leader>fg", "live_grep()")
telemap("<leader>fw", "grep_string({ search = vim.fn.input('GREPPER > '), theme = 'ivy' })")
telemap("<leader>gs", "git_status()")
telemap("<leader>gc", "git_commits()")
telemap("<leader>k", "keymaps()")
telemap("<leader>b", "buffers()")
telemap("<leader>en", "find_files({ cwd = '~/.config' })")
telemap("<C-q>", "quickfix()")

-- TROUBLE
troublemap("<leader>tw", "workspace_diagnostics")
troublemap("<leader>td", "workspace_diagnostics")
troublemap("<leader>xl", "loclist")
troublemap("<leader>tq", "quickfix")
troublemap("gR", "lsp_references")

-- LSP SAGA
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>")
map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
-- map("n", "?", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- map("n", "<leader>h", "<Cmd>Lspsaga signature_help<CR>", { silent = true, noremap = true })

-- NEOGIT
map("n", "<leader>gg", "<cmd>:Neogit<cr>")

-- find replacer
map("n", "<S-f>", '<cmd>lua require("searchbox").incsearch()<CR>', { noremap = true })
map("n", "<leader>re", '<cmd>lua require("searchbox").replace()<CR>', { noremap = true })

-- HOP
map("n", "s", "<cmd>:HopWord<CR>")

-- FLOAT TERM
map("n", "<leader>m", "<cmd>lua require('FTerm').toggle()<cr>", { noremap = true })
map("t", "<leader>m", "<cmd>lua require('FTerm').toggle()<cr>", { noremap = true })

-- COLOR PICKER
map("n", "<leader>cp", "<cmd>PickColor<cr>")
map("i", "<C-c>", "<cmd>PickColorInsert<cr>")

-- SYSTEM CLIPBOARD
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>yy", '"+y')
map("n", "Y", "y$", { noremap = true })

-- NEO TREE
map("n", "<leader><space>", ":NeoTreeFloatToggle<CR>")

-- copilot
map("i", "<C-h>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })

-- Move lines up and down
map("n", "<S-up>", "<cmd>:m-2<CR>")
map("i", "<S-up>", "<cmd>:m-2<CR>")
map("n", "<S-Down>", "<cmd>:m+<CR>")
map("i", "<S-Down>", "<cmd>:m+<CR>")

-- buffer manager
map("n", "<C-=>", "<cmd>:vert sb#<CR>")
map("n", "<leader><BS>", "<cmd>:bd<CR>")
map("n", "<C-BS>", "<cmd>:bd<CR>")

-- map("n", "<C-right>", "<cmd>:bprev<CR>")
-- map("n", "<C-left>", "<cmd>:bnext<CR>")

-- barbar
map("n", "<C-right>", "<cmd>:BufferNext<CR>")
map("n", "<C-]>", "<cmd>:BufferNext<CR>")
map("n", "<C-left>", "<cmd>:BufferPrevious<CR>")
map("n", "<C-[>", "<cmd>:BufferPrevious<CR>")
map("n", "<leader>1", "<cmd>:BufferFirst<CR>")

-- indenters
map("v", "<", "<gv")
map("v", ">", ">gv")

--Remap for dealing with word wrap

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

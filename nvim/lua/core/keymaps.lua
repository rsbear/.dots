local utils = require("core.utils")
local map = utils.keymap.map

-- MAP SPACE TO LEADER
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TELESCOPE
map("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
-- map("n", "<leader>bb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>sf", "<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>")
map("n", "<leader>fd", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<CR>")
map("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>")
map("n", "<leader>?", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
map("n", "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('GREPPER > ')})<CR>")

-- TROUBLE
map("n", "<leader>tw", "<cmd>Trouble lsp_document_diagnostics<cr>")
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
map("n", "<leader>tq", "<cmd>Trouble quickfix<cr>")
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- NEOGIT
map("n", "<leader>gg", "<cmd>:Neogit<cr>")

-- find replacer
map("n", "<S-f>", '<cmd>lua require("searchbox").incsearch()<CR>', { noremap = true })
map("n", "<leader>re", '<cmd>lua require("searchbox").replace()<CR>', { noremap = true })

-- HOP
map("n", "<leader>ff", [[<cmd>:HopWord<CR>]])

-- FLOAT TERM
map("n", "<leader>b", "<cmd>lua require('FTerm').toggle()<cr>")
map("t", "<leader>b", "<cmd>lua require('FTerm').toggle()<cr>")

-- GIT
map("n", "<leader>ga", "<cmd>:Git add . | :Git commit<CR>")
map("n", "<leader>gp", "<cmd>:Git push<CR>")

-- SYSTEM CLIPBOARD
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>yy", '"+y')
map("n", "Y", "y$", { noremap = true })

-- NVIM TREE
map("n", "<leader>r", ":NvimTreeRefresh<CR>")
map("n", "<leader>n", ":NvimTreeFindFile<CR>")
map("n", "<leader><space>", ":NvimTreeToggle<CR>")

-- CMP complete functiones
map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

-- copilot
map("i", "<C-e>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true })

-- Move lines up and down
map("n", "<S-up>", "<cmd>:m-2<CR>")
map("i", "<S-up>", "<cmd>:m-2<CR>")
map("n", "<S-Down>", "<cmd>:m+<CR>")
map("i", "<S-Down>", "<cmd>:m+<CR>")

-- buffer manager
map("n", "<C-=>", "<cmd>:vert sb#<CR>")
map("n", "<leader><BS>", "<cmd>:bd<CR>")
-- map("n", "<C-right>", "<cmd>:bprev<CR>")
-- map("n", "<C-left>", "<cmd>:bnext<CR>")
-- barbar
map("n", "<C-right>", "<cmd>:BufferNext<CR>")
map("n", "<C-left>", "<cmd>:BufferPrevious<CR>")

-- indenters
map("v", "<", "<gv")
map("v", ">", ">gv")

--Remap for dealing with word wrap

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

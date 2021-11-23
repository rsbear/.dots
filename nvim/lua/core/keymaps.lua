local utils = require 'core.utils'
local map = utils.keymap.map

-- MAP SPACE TO LEADER
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- TELESCOPE
map('n', '<C-p>', [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
map('n', '<leader>bb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
map('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]])
map('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
map(
  'n',
  '<leader>ps',
  [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >>> ")})<CR>]]
)
map('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]])
map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]])
map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
map('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]])
map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])

-- TROUBLE
map('n', '<leader>xx', '<cmd>Trouble<cr>')
map('n', '<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>')
map('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>')
map('n', '<leader>xl', '<cmd>Trouble loclist<cr>')
map('n', '<leader>xq', '<cmd>Trouble quickfix<cr>')
map('n', 'gR', '<cmd>Trouble lsp_references<cr>')

-- neogit
map('n', '<leader>gg', '<cmd>:Neogit kind=vsplit<cr>')

-- TOGGLE DIAGNOSTICS
-- map('n', '<leader>d', ':call v:lua.toggle_diagnostics()<CR>')

-- HOP
map('n', '<C-f>', '<cmd>:HopWord<CR>')

-- GIT
map('n', '<leader>ga', '<cmd>:Git add . | :Git commit<CR>')
map('n', '<leader>gp', '<cmd>:Git push<CR>')

-- SYSTEM CLIPBOARD
map('n', '<leader>y', '+y')
map('v', '<leader>y', '+y')
map('n', '<leader>yy', '+y')
map('n', 'Y', 'y$', { noremap = true })

-- BUFFER DELETE
map('n', '<leader><BS>', '<cmd>:bd<CR>')

-- VSPLIT BUFF
map('n', '<C-=>', '<cmd>:vert sb#<CR>')

-- NVIM TREE
map('n', '<leader>r', ':NvimTreeRefresh<CR>')
map('n', '<leader>n', ':NvimTreeFindFile<CR>')
map('n', '<leader><space>', ':NvimTreeToggle<CR>')

-- CMP complete functiones
map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- copilot
vim.cmd 'imap <silent><script><expr> <C-e> copilot#Accept("<CR>")'

-- Move lines up and down
map('n', '<S-up>', '<cmd>:m-2<CR>')
vim.cmd 'nnoremap <S-Down> :m+<CR>'
vim.cmd 'inoremap <S-Up> <Esc>:m-2<CR>'
vim.cmd 'inoremap <S-Down> <Esc>:m+<CR>'

-- buffer manager
vim.cmd 'nmap <C-right> :bnext<CR>'
vim.cmd 'nmap <C-left> :bprev<CR>'

-- indenters
vim.cmd 'vnoremap < <gv'
vim.cmd 'vnoremap > >gv'

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

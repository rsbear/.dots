local export = {}

local function lspmap(key, cmd, opt)
  vim.keymap.set('n', key, '<cmd>lua ' .. cmd .. '<CR>', opt)
end

function export.lsp_on_attach(client, bufnr)
  require('lsp.ui').setup()
  local opts = { noremap = true, silent = true, buffer = bufnr }
  lspmap('K', 'vim.lsp.buf.type_definition()', opts)
  lspmap('gd', 'vim.lsp.buf.definition()', opts)
  lspmap('gD', 'vim.lsp.buf.declaration()', opts)
  lspmap('gi', 'vim.lsp.buf.implementation()', opts)
  lspmap('<leader>e', 'vim.diagnostic.open_float({ border = "rounded" })')
  lspmap('<leader>gh', 'vim.lsp.buf.signature_help()', opts)
  lspmap('<leader>rn', 'vim.lsp.buf.rename()', opts)
  lspmap('<leader>[', 'vim.diagnostic.goto_prev({ border = "rounded" })')
  lspmap('<leader>]', 'vim.diagnostic.goto_next({ border = "rounded" })')
  lspmap('<leader>n', 'vim.lsp.buf.signature_help()', opts)
  lspmap('<leader>ca', 'vim.lsp.buf.code_action()', opts)
  lspmap('?', 'vim.lsp.buf.hover()', opts)
  lspmap('<leader>i', 'vim.lsp.show()', opts)

  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = {
      '*',
    },
    command = [[:FormatWrite]],
  })
end

local opts = { silent = true, noremap = true }
local km = vim.keymap.set

local function telemap(key, cmd)
  km('n', key, '<cmd>lua require("telescope.builtin").' .. cmd .. '<CR>', opts)
end

function export.plugin_keymaps()
  -- TELESCOPE
  telemap('<C-p>', 'find_files()')
  telemap('<leader>a', 'find_files()')
  telemap('<leader>ff', 'git_files()')
  telemap('<leader>gf', 'git_status()')
  telemap('<leader>fb', 'current_buffer_fuzzy_find()')
  telemap('<leader>fg', 'live_grep()')
  telemap('<leader>fw', "grep_string({ search = vim.fn.input('GREP FOR WORD > '), theme = 'ivy' })")
  telemap('<leader>gt', 'git_status()')
  telemap('<leader>gc', 'git_commits()')
  telemap('<leader>gr', 'lsp_references()')
  telemap('<leader>k', 'keymaps()')
  telemap('<leader><space>', 'buffers()')
  telemap('<leader>en', "find_files({ cwd = '~/.config' })")
  telemap('<C-q>', 'quickfix()')
  -- NPM <C-i> = install, <C-d> = uninstall
  km('n', '<leader>b', '<cmd>:Telescope npm scripts<CR>')
  km('n', '<leader>p', '<cmd>:Telescope npm packages<CR>')

  -- TROUBLE
  local function troublemap(key, cmd)
    km('n', key, '<cmd>Trouble ' .. cmd .. '<CR>', opts)
  end
  troublemap('<leader>tw', 'workspace_diagnostics')
  troublemap('<leader>tl', 'loclist')
  troublemap('<leader>tq', 'quickfix')
  troublemap('gr', 'lsp_references')

  -- SYMBOLS OUTLINE
  km('n', '<leader>s', '<cmd>SymbolsOutline<CR>', opts)

  -- NEOGIT
  km('n', '<leader>gg', '<cmd>:Neogit<cr>', opts)

  -- find replacer
  km('n', '<S-f>', '<cmd>lua require("searchbox").incsearch()<CR>', opts)
  km('n', '<leader>re', '<cmd>lua require("searchbox").replace()<CR>', opts)

  -- HOP
  km('n', 's', '<cmd>:HopWord<CR>')

  -- FLOAT TERM
  km('n', '<leader>.', "<cmd>lua require('FTerm').toggle()<cr>", { noremap = true })
  km('t', '<leader>.', "<cmd>lua require('FTerm').toggle()<cr>", { noremap = true })

  -- FLOAT TERM
  km('n', '<leader>m', '<cmd>:MindOpenMain<cr>', { noremap = true })
  km('n', '<leader>c', '<cmd>:MindClose<cr>', { noremap = true })

  -- NEO TREE
  km('n', '\\', '<cmd>Neotree float<CR>', opts)
  -- km('n', '\\', '<cmd>Neotree reveal<CR>', opts) -- this is a fix for using neotree 'current' pos
  km('n', '<leader>gs', '<cmd>Neotree git_status<CR>', opts)

  -- copilot
  km('i', '<C-Space>', 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })

  -- barbar
  km('n', '<C-right>', '<cmd>:BufferNext<CR>', opts)
  km('n', '<C-]>', '<cmd>:BufferNext<CR>', opts)
  km('n', '<C-l>', '<cmd>:BufferNext<CR>', opts)
  km('n', '<C-left>', '<cmd>:BufferPrevious<CR>', opts)
  km('n', '<C-h>', '<cmd>:BufferPrevious<CR>', opts)
  km('n', '<leader>1', '<cmd>:BufferFirst<CR>', opts)

  -- ZenMode
  km('n', '<leader>z', '<cmd>ZenMode<CR>', opts)
end

function export.core_keymaps()
  -- SYSTEM CLIPBOARD
  km('n', '<leader>y', '"+y', opts)
  km('v', '<leader>y', '"+y', opts)
  km('n', '<leader>yy', '"+y', opts)
  km('n', 'Y', 'y$', { noremap = true })

  -- Move lines up and down
  km('n', '<S-up>', '<cmd>:m-2<CR>', opts)
  km('i', '<S-up>', '<cmd>:m-2<CR>', opts)
  km('n', '<S-Down>', '<cmd>:m+<CR>', opts)
  km('i', '<S-Down>', '<cmd>:m+<CR>', opts)

  -- buffer manager
  km('n', '<C-=>', '<cmd>:vert sb#<CR>', opts)
  km('n', '<leader><BS>', '<cmd>:bd<CR>', opts)
  km('n', '<C-BS>', '<cmd>:Bdelete<CR>', opts)

  -- indenters
  km('v', '<', '<gv', opts)
  km('v', '>', '>gv', opts)

  --Remap for dealing with word wrap
  km('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
  km('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

  -- inspect highlight group
  km('n', '<leader>o', function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    print(vim.inspect(result))
  end, { noremap = true, silent = false })
end

return export

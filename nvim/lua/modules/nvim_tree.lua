vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '.DS_Store' }
vim.g.nvim_tree_special_files = { '.env', 'README.md', 'Makefile', 'MAKEFILE' }
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_add_trailing = 1

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 0,
}

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '',
    staged = '',
    unmerged = '',
    renamed = '',
    untracked = '',
    deleted = '',
  },
  folder = {
    arrow_open = '',
    arrow_closed = '',
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
  },
  lsp = {
    hint = '',
    info = '',
    warning = '',
    error = '',
  },
}

return function()
  local tree = require 'nvim-tree'

  tree.setup {
    disable_netrw = false,
    auto_close = false,
    open_on_tab = false,
    update_cwd = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      side = 'left',
      width = 40,
    },
  }
end

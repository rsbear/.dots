-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      event_handlers = {
        {
          event = 'file_opened',
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require('neo-tree.command').execute { action = 'close' }
          end,
        },
      },

      filesystem = {
        filtered_items = { --These filters are applied to both browsing and searching
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { 'node_modules', '.git' },
          never_show = { '.DS_Store' },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = false,
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = 'open_current',
        float = {
          width = 90,
          height = 90,
          position = 'left',
        },
      },
      window = {
        width = 90,
        position = 'left',
      },
      float = {
        width = 90,
        height = 90,
        position = 'left',
      },
    }
  end,
}

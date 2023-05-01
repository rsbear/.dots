return {

  {
    'j-morano/buffer_manager.nvim',
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      local trouble = require('trouble.providers.telescope')

      require('telescope').setup({
        defaults = {
          path_display = {
            shorten = 7,
          },
          vimgrep_arguments = {
            'rg',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          layout_config = {
            horizontal = { width = 0.9 },
          },
          file_ignore_patterns = {
            'node_modules',
            'yarn.lock',
            'yarn-error.log',
            'pnpm-lock.yaml',
            'package-lock.json',
            '.git',
            'dist',
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<C-t>'] = trouble.open_with_trouble,
            },
            n = {
              ['<C-t>'] = trouble.open_with_trouble,
            },
          },
        },
        pickers = {
          git_status = { shorten_path = true },
          live_grep = { theme = 'dropdown' },
          buffers = { theme = 'dropdown' },
          -- find_files = {
          -- theme = "dropdown",
          -- previewer = false
          -- },
        },
      })
    end,
  },

  { -- npm task runner
    'elianiva/telescope-npm.nvim',
  },

  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup()
    end,
  },

  { -- search and replace
    'VonHeikemen/searchbox.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
    },
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({
        plugins = {
          presets = {
            -- Disable operators
            operators = false,
          },
        },
      })
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require('neo-tree').setup({
        close_if_last_window = true,
        popup_border_style = 'rounded',
        default_component_configs = {
          icon = { folder_closed = '-', folder_open = '' },
        },
        window = { position = 'float' },
        -- window = { position = 'right' },
        filesystem = {
          filtered_items = { --These filters are applied to both browsing and searching
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = { 'node_modules', '.git' },
            never_show = { '.DS_Store' },
          },
          follow_current_file = true,
          group_empty_dirs = false,
          use_libuv_file_watcher = true,
          hijack_netrw_behavior = 'open_current',
        },
        buffers = {
          follow_current_file = true,
          group_empty_dirs = false,
        },
        git_status = {
          window = {
            position = 'float',
            -- width = 40,
            width = 100,
            mappings = {
              ['A'] = 'git_add_all',
              ['u'] = 'git_unstage_file',
              ['a'] = 'git_add_file',
              ['r'] = 'git_revert_file',
              ['c'] = 'git_commit',
              ['p'] = 'git_push',
              ['gg'] = 'git_commit_and_push',
            },
          },
        },
      })
    end,
  },
}

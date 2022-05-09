return function()
  require('neo-tree').setup {
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      icon = {
        folder_closed = '',
        folder_open = '',
      },
    },
    filesystem = {
      filters = { --These filters are applied to both browsing and searching
        show_hidden = true,
        respect_gitignore = false,
      },
      use_libuv_file_watcher = true,
      window = {
        popup = {
          position = { col = '0%', row = '1' },
          size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ':~')
            local root_len = string.len(root_name) + 4
            return {
              width = math.max(root_len, 60),
              height = vim.o.lines - 0,
            }
          end,
        },
        mappings = {
          ['<2-LeftMouse>'] = 'open',
          ['<cr>'] = 'open',
          ['S'] = 'open_split',
          ['v'] = 'open_vsplit',
          ['C'] = 'close_node',
          ['.'] = 'set_root',
          ['u'] = 'navigate_up',
          ['H'] = 'toggle_hidden',
          ['I'] = 'toggle_gitignore',
          ['R'] = 'refresh',
          ['/'] = 'filter_as_you_type',
          ['f'] = 'filter_on_submit',
          ['<c-x>'] = 'clear_filter',
          ['a'] = 'add',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['c'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
        },
      },
    },
    buffers = {
      show_unloaded = false,
      window = {
        position = 'left',
        width = 70,
        mappings = {
          ['<2-LeftMouse>'] = 'open',
          ['<cr>'] = 'open',
          ['S'] = 'open_split',
          ['v'] = 'open_vsplit',
          ['u'] = 'navigate_up',
          ['.'] = 'set_root',
          ['R'] = 'refresh',
          ['a'] = 'add',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['c'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
        },
      },
    },
    git_status = {
      window = {
        position = 'left',
        width = 70,
        mappings = {
          ['<2-LeftMouse>'] = 'open',
          ['<cr>'] = 'open',
          ['S'] = 'open_split',
          ['v'] = 'open_vsplit',
          ['C'] = 'close_node',
          ['R'] = 'refresh',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['c'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['A'] = 'git_add_all',
          ['gu'] = 'git_unstage_file',
          ['ga'] = 'git_add_file',
          ['gr'] = 'git_revert_file',
          ['gp'] = 'git_push',
          ['gg'] = 'git_commit_and_push',
        },
      },
    },
  }

  vim.cmd [[nnoremap \ :NeoTreeRevealToggle<cr>]]
end

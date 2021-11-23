return function()
  local cokeline = require 'cokeline'
  local get_hex = require('cokeline.utils').get_hex

  cokeline.setup {
    default_hl = {
      focused = {
        fg = get_hex('Normal', 'fg'),
        bg = get_hex('ColorColumn', 'bg'),
      },
      unfocused = {
        fg = get_hex('Comment', 'fg'),
        bg = get_hex('ColorColumn', 'bg'),
      },
    },
    components = {
      {
        text = function(buffer)
          return ' ' .. buffer.devicon.icon
        end,
        hl = {
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
      },
      {
        text = function(buffer)
          return buffer.filename
        end,
        hl = {
          fg = function(buffer)
            if buffer.lsp.errors ~= 0 then
              return vim.g.terminal_color_1 -- red
            end
            if buffer.lsp.warnings ~= 0 then
              return vim.g.terminal_color_3 -- yellow
            end
          end,

          style = function(buffer)
            local style
            if buffer.is_focused then
              style = 'bold'
            end
            if buffer.lsp.errors ~= 0 then
              if style then
                style = style .. ',underline'
              else
                style = 'underline'
              end
            end
            return style
          end,
        },
      },
      {
        text = ' ',
      },
      {
        text = '',
        delete_buffer_on_left_click = false,
      },
      {
        text = ' ',
      },
    },
  }
end

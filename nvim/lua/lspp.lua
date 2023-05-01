return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('mason').setup()
      require('lsp').init()
    end,
  },

  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({
        position = 'right', -- position of the list can be: bottom, top, left, right
        width = 50,
        signs = {
          error = '',
          warning = '',
          hint = '',
          information = '',
          other = '﫠',
        },
      })
    end,
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = true, -- automatically select the first item
        insert = false, -- use insert confirm behavior instead of replace
        map_char = { -- modifies the function or method delimiter by filetypes
          all = '(',
          tex = '{',
        },
        check_ts = true,
        ts_config = {
          lua = { 'string' }, -- it will not add a pair on that treesitter node
          javascript = { 'template_string' },
          java = false, -- don't check treesitter on java
        },
      })
    end,
  },

  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('Comment').setup({

        -- handle tsx
        pre_hook = function(ctx)
          -- Only calculate commentstring for tsx filetypes
          if vim.bo.filetype == 'typescriptreact' then
            local U = require('Comment.utils')

            -- Determine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.blockwise then
              location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
              location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
              key = type,
              location = location,
            })
          end
        end,
      })
    end,
  },

  {
    'mhartington/formatter.nvim',
    config = function()
      local util = require('formatter.util')

      require('formatter').setup({
        filetype = {
          typescript = {
            function()
              return {
                exe = 'prettier',
                args = { vim.api.nvim_buf_get_name(0) },
                -- args = {
                -- 	"fmt",
                -- 	"--config",
                -- 	"~/.config/dprint/dprint.json",
                -- 	"--stdin",
                -- 	vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                -- },
                stdin = true,
              }
            end,
          },
          typescriptreact = {
            function()
              return {
                exe = 'prettier',
                args = { vim.api.nvim_buf_get_name(0) },
                -- exe = 'dprint',
                -- args = {
                -- 	"fmt",
                -- 	"--config",
                -- 	"~/.config/dprint/dprint.json",
                -- 	"--stdin",
                -- 	vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                -- },
                stdin = true,
              }
            end,
          },
          svelte = {
            function()
              return {
                exe = 'prettier',
                args = { vim.api.nvim_buf_get_name(0) },
                exe = 'dprint',
                args = {
                  'fmt',
                  '--config',
                  '~/.config/dprint/dprint.json',
                  '--stdin',
                  vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                },
                stdin = true,
              }
            end,
          },
          lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require('formatter.filetypes.lua').stylua,

            -- You can also define your own configuration
            function()
              -- Supports conditional formatting
              if util.get_current_buffer_file_name() == 'special.lua' then
                return nil
              end

              -- Full specification of configurations is down below and in Vim help
              -- files
              return {
                exe = 'stylua',
                args = {
                  '--search-parent-directories',
                  '--stdin-filepath',
                  util.escape_path(util.get_current_buffer_file_path()),
                  '--',
                  '-',
                },
                stdin = true,
              }
            end,
          },
        },
      })
    end,
  },

  {
    'utilyre/barbecue.nvim',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = function()
      require('barbecue').setup({
        theme = {
          normal = { fg = '#8CB2C0' },
          dirname = { fg = '#667F9E' },
        },
        symbols = {
          separator = '',
        },
      })
    end,
  },
}

-- haha uh oh
-- use({ "github/copilot.vim" })

-- use({ 'folke/lsp-colors.nvim' })

-- use({
--   'glepnir/lspsaga.nvim',
--   opt = true,
--   -- after = true,
--   branch = 'main',
--   event = 'LspAttach',
--   config = function()
--     require('lspsaga').setup({})
--   end,
--   requires = {
--     { 'nvim-tree/nvim-web-devicons' },
--     --Please make sure you install markdown and markdown_inline parser
--     { 'nvim-treesitter/nvim-treesitter' },
--   },
-- })

-- use({
--   'jinzhongjia/LspUI.nvim',
--   -- event = 'VimEnter',
--   config = function()
--     require('LspUI').setup()
--   end,
-- })

-- this is actually a really cool breadcrumb
-- use({
--  'utilyre/barbecue.nvim',
--  tag = '*',
--  dependencies = {
--  'SmiteshP/nvim-navic',
--    'nvim-tree/nvim-web-devicons', -- optional dependency
--  },
--  after = 'nvim-web-devicons', -- keep this if you're using NvChad
--  config = function()
--    require('barbecue').setup({
--      theme = {
--        normal = { fg = '#8CB2C0' },
--        dirname = { fg = '#667F9E' },
--      },
--      symbols = {
--        separator = '',
--      },
--    })
--  end,
-- })

-- use {"lukas-reineke/lsp-format.nvim"}

-- use({
--   'jose-elias-alvarez/typescript.nvim',
--   config = function()
--     require('typescript').setup({
--       disable_commands = false, -- prevent the plugin from creating Vim commands
--       debug = false, -- enable debug logging for commands
--       go_to_source_definition = {
--         fallback = false, -- fall back to standard LSP definition on failure
--       },
--       server = { -- pass options to lspconfig's setup method
--         root_dir = require('lspconfig').util.root_pattern({ 'package.json', 'yarn.lock', 'package-lock.json' }),
--         settings = {
--           update_on_insert = false,
--         },
--         on_attach = require('keymaps').lsp_on_attach,
--       },
--     })
--   end,
-- })

-- use({ 'RishabhRD/popfix' })
-- use({ 'RishabhRD/nvim-lsputils' })

-- use('ray-x/go.nvim')
-- use('ray-x/guihua.lua')

-- use({
--  'simrat39/symbols-outline.nvim',
--  config = function()
--    require('symbols-outline').setup({
--      width = 40,
--      autofold_depth = 0,
--      auto_unfold_hover = false,
--      symbols = {
--        Constant = { icon = '', hl = 'TSConstant' },
--        Function = { icon = '', hl = 'TSFunction' },
--        Method = { icon = '', hl = 'TSMethod' },
--        Variable = { icon = '', hl = 'TSVariable' },
--      },
--    })
--  end,
-- })

-- use({
-- 	"edgedb/edgedb-vim",
-- })

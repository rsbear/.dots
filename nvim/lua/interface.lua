return {
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    -- tag = 'v1.*', -- Optional tag release
    config = function()
      require('rose-pine').setup({
        dark_variant = 'main',
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = true,
        groups = {
          background = '#1B1D23', -- poimandres
          TSString = { style = 'italic' },
          ['@tag.attribute'] = { style = 'italic' },
        },
        highlight_groups = {
          LineNr = { fg = '#3b384d' },
          CursorLineNr = { fg = '#9ccfd8' },
          DashboardHeader = { fg = '#ebbcba' },
          DashboardCenter = { fg = '#696778' },
          DashboardShortCut = { fg = '#696778' },
          GitSignsAdd = { fg = '#008D83' },
          IndentBlanklineChar = { fg = '#2c2a36' },
          FloatBorder = { fg = '#2a273f', bg = 'none' },
          -- bar bar
          BufferCurrent = { fg = '#ebbcba', bg = '#191724' },
          BufferCurrentMod = { fg = '#ebbcba', bg = '#191724' },
          BufferCurrentIcon = { fg = '#ebbcba', bg = '#191725' },
          BufferCurrentSign = { fg = '#ebbcba', bg = '#191725' },
          BufferInactiveMod = { fg = '#908caa', bg = '#191724' },
          -- ["@tag.attribute"] = { style = "italic"},
          -- working on poimandres
          -- working on poimandres
          -- working on poimandres
          -- ['@constructor'] = { fg = '#ADD7FF' }, -- something related to the query below
          -- ['@constructor.tsx'] = { fg = '#5DE4C7' }, -- components in jsx, import statements
          -- ['@exception'] = { fg = '#D0679D' }, -- throw keyword
          -- ['@function'] = { fg = '#a0b9d8' }, -- self explanatory
          -- ['@function.call'] = { fg = '#B4AFBC' }, -- builtin fns like useCallback
          -- ['@include'] = { fg = '#908caa' }, -- import and from
          -- ['@keyword'] = { fg = '#91B4D5' },
          -- ['@keyword.control'] = { fg = '#5DE4C7' },
          -- ['@keyword.operator'] = { fg = '#5DE4C7' },
          -- ['@method.call'] = { fg = '#B4AFBC' }, -- methods
          -- ['@parameter'] = { fg = '#E4F0FB' }, -- fn args
          -- ['@property'] = { fg = '#E4F0FB' }, -- dot notation
          -- ['@punctuation.bracket'] = { fg = '#ebbcba' },
          -- ["@string"] = { fg = "#5DE4C7" },
          -- -- ["@tag"] = { fg = "#ADD7FF" }, -- regular html tags
          -- ["@tag.attribute"] = { fg = "#91B4D5", style = "italic" }, -- html tag attrs
          -- ["@tag.delimiter"] = { fg = "#e0def4" }, -- html tag attrs
          -- ["@type"] = { fg = "#908caa" }, -- types
          -- -- figure these out please
          -- ["@namespace"] = { fg = "#E4F0FB" }, -- i dont know
          -- ["@preproc"] = { fg = "#eb6f92" }, --  i dont know
          -- tsxTag = { fg = "#5DE4C7" },
          -- working on substrata
          -- working on substrata
          -- working on substrata
          Function = { fg = '#D1C0E6' },
          ['@constructor'] = { fg = '#ADD7FF' }, -- something related to the query below
          ['@constructor.tsx'] = { fg = '#5DE4C7' }, -- components in jsx, import statements
          ['@exception'] = { fg = '#D0679D' }, -- throw keyword
          ['@function'] = { fg = '#ADD7FF' }, -- self explanatory
          ['@function.call'] = { fg = '#B4AFBC' }, -- builtin fns like useCallback
          ['@include'] = { fg = '#908caa' }, -- import and from
          ['@keyword'] = { fg = '#667F9E' }, --  i dont know
          ['@keyword.control'] = { fg = '#5DE4C7' },
          ['@keyword.operator'] = { fg = '#5DE4C7' },
          ['@method.call'] = { fg = '#8CC0C0' }, -- methods
          ['@parameter'] = { fg = '#E4F0FB' }, -- fn args
          ['@property'] = { fg = '#8CB2C0' }, -- dot notation
          ['@punctuation.bracket'] = { fg = '#ebbcba' },
          ['@string'] = { fg = '#659ea2' },
          ['@tag'] = { fg = '#667F9E' }, -- regular html tags
          ['@tag.attribute'] = { fg = '#91B4D5', italic = true }, -- html tag attrs
          ['@tag.delimiter'] = { fg = '#e0def4' }, -- html tag attrs
          -- ['@type'] = { fg = '#908caa' }, -- types
          -- -- figure these out please
          ['@namespace'] = { fg = '#E4F0FB' }, -- i dont know
          ['@preproc'] = { fg = '#eb6f92' }, --  i dont know
          ['@variable'] = { fg = '#91B4D5' },
          tsxTag = { fg = '#667F9E' },
        },
      })
      vim.cmd('colorscheme rose-pine')
      local hi = vim.api.nvim_set_hl

      -- git gutter theme
      -- hi(0, "GitSignsAdd", { fg = "#008D83", bg = "none" })
      -- hi(0, 'GitGutterChange', { fg = '#845ec2', bg = 'none' })
      -- hi(0, "DiffDelete", { fg = "#f0a0c0", bg = "#333333" })

      --[[ hi(0, "DashboardHeader", { fg = "#ebbcba", bg = "none" }) -- rose pine, rose ]]
      -- hi(0, 'DashboardCenter1Icon', { fg = '#696778', bg = 'none' })
      -- hi(0, 'DashboardCenter3Icon', { fg = '#696778', bg = 'none' })
      -- hi(0, 'DashboardCenter5Icon', { fg = '#696778', bg = 'none' })
      -- hi(0, 'DashboardCenter7Icon', { fg = '#696778', bg = 'none' })
      --[[ hi(0, "DashboardShortCut", { fg = "#696778", bg = "none" }) ]]
      -- hi(0, 'DashboardFooter', { fg = '#696778', bg = 'none' })
      hi(0, 'TelescopeBorder', { fg = '#ea9a97', bg = '#201E26' })
      hi(0, 'TelescopeMatching', { fg = '#ea9a97', bg = '#252830' })
      hi(0, 'TelescopeSelection', { fg = '#ea9a97', bg = '#252830' })
      hi(0, 'TelescopeNormal', { fg = '#ffffff', bg = '#2a273f' })
      hi(0, 'TelescopePromptTitle', { fg = '#c4a7e7', bg = '#353945' })
      hi(0, 'TelescopePromptBorder', { fg = '#353945', bg = '#353945' })
      hi(0, 'TelescopePromptNormal', { fg = '#ffffff', bg = '#353945' })
      hi(0, 'TelescopeResultsBorder', { fg = '#252830', bg = '#252830' })
      hi(0, 'TelescopeResultsNormal', { fg = '#b0c6ce', bg = '#252830' })
      hi(0, 'TelescopePreviewBorder', { fg = '#252830', bg = '#252830' })
      hi(0, 'TelescopePreviewNormal', { fg = '#252830', bg = '#252830' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'astro',
          'bash',
          'css',
          'dockerfile',
          'fish',
          'go',
          'gomod',
          'graphql',
          'html',
          'json',
          'json5',
          'javascript',
          'lua',
          'markdown',
          'markdown_inline',
          'php',
          'phpdoc',
          'prisma',
          'scss',
          'svelte',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'yaml',
        },
        highlight = {
          enable = true,
        },
        auto_install = true,
        indent = { enable = true },
        autopairs = { enable = true },
        autotag = { enable = true },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
          config = {
            javascript = {
              __default = '// %s',
              jsx_element = '{/* %s */}',
              jsx_fragment = '{/* %s */}',
              jsx_attribute = '// %s',
              comment = '// %s',
            },
          },
        },
        textsubjects = {
          enable = true,
          prev_selection = ',', -- (Optional) keymap to select the previous selection
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
      })
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
    },
  },

  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
  },

  -- use 'nvim-treesitter/nvim-treesitter-context'

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({ filetype_exclude = { 'dashboard' } })
    end,
  },

  {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup({
        window = { backdrop = 1 },
        plugins = {
          twilight = { enabled = false },
        },
        on_open = function()
          vim.opt.number = false
        end,
        on_close = function()
          vim.opt.number = true
        end,
      })
    end,
  },

  {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup()
    end,
  },

  {
    'mvllow/modes.nvim',
    event = 'BufRead',
    config = function()
      require('modes').setup({
        line_opacity = 0.3,
        focus_only = false,
      })
    end,
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
        theme = 'doom',
        preview = {
          file_height = 12,
          file_width = 80,
        },
        config = {
          center = {
            {
              icon = '  ',
              icon_hl = 'DashboardCenter1Icon',
              desc = 'finder                           ',
              key = '~',
              key_hl = 'DashboardCenter1Icon',
              action = 'Telescope find_files find_command=rg,--hidden,--files',
            },
            {
              icon = '  ',
              icon_hl = 'DashboardCenter1Icon',
              desc = 'notes                            ',
              key = '~',
              key_hl = 'DashboardCenter1Icon',
              action = ':e ~/Documents/vimnotes.md',
            },
            {
              icon = '  ',
              icon_hl = 'DashboardCenter1Icon',
              desc = 'dots                             ',
              key = '~',
              key_hl = 'DashboardCenter1Icon',
              action = 'Telescope find_files cwd=~/.config',
            },
            {
              icon = '  ',
              icon_hl = 'DashboardCenter1Icon',
              desc = 'exit                             ',
              key = '~',
              key_hl = 'DashboardCenter1Icon',
              action = 'qa',
            },
          },
          header = {
            [[                               ]],
            [[                               ]],
            [[                               ]],
            [[                               ]],
            [[                               ]],
            [[                               ]],
            [[                               ]],
            [[   ▄████▄              ▒▒▒▒▒   ]],
            [[  ███▄█▀              ▒ ▄▒ ▄▒  ]],
            [[ ▐████     █  █  █   ▒▒▒▒▒▒▒▒▒ ]],
            [[  █████▄             ▒▒▒▒▒▒▒▒▒ ]],
            [[   ▀████▀            ▒ ▒ ▒ ▒ ▒ ]],
            [[                               ]],
            [[                               ]],
            [[                               ]],
            [[                               ]],
          },
        },
      })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}

-- use({ 'lewis6991/impatient.nvim' })

-- use({
--   'glepnir/dashboard-nvim',
--   event = 'VimEnter',
--   config = function()
--     require('dashboard').setup({
--       theme = 'doom',
--       preview = {
--         file_height = 12,
--         file_width = 80,
--       },
--       config = {
--         center = {
--           {
--             icon = '  ',
--             icon_hl = 'DashboardCenter1Icon',
--             desc = 'finder                           ',
--             key = '~',
--             key_hl = 'DashboardCenter1Icon',
--             action = 'Telescope find_files find_command=rg,--hidden,--files',
--           },
--           {
--             icon = '  ',
--             icon_hl = 'DashboardCenter1Icon',
--             desc = 'notes                            ',
--             key = '~',
--             key_hl = 'DashboardCenter1Icon',
--             action = ':e ~/Documents/vimnotes.md',
--           },
--           {
--             icon = '  ',
--             icon_hl = 'DashboardCenter1Icon',
--             desc = 'dots                             ',
--             key = '~',
--             key_hl = 'DashboardCenter1Icon',
--             action = 'Telescope find_files cwd=~/.config',
--           },
--           {
--             icon = '  ',
--             icon_hl = 'DashboardCenter1Icon',
--             desc = 'exit                             ',
--             key = '~',
--             key_hl = 'DashboardCenter1Icon',
--             action = 'qa',
--           },
--         },
--         header = {
--           [[                               ]],
--           [[                               ]],
--           [[                               ]],
--           [[                               ]],
--           [[                               ]],
--           [[                               ]],
--           [[                               ]],
--           [[   ▄████▄              ▒▒▒▒▒   ]],
--           [[  ███▄█▀              ▒ ▄▒ ▄▒  ]],
--           [[ ▐████     █  █  █   ▒▒▒▒▒▒▒▒▒ ]],
--           [[  █████▄             ▒▒▒▒▒▒▒▒▒ ]],
--           [[   ▀████▀            ▒ ▒ ▒ ▒ ▒ ]],
--           [[                               ]],
--           [[                               ]],
--           [[                               ]],
--           [[                               ]],
--         },
--       },
--     })
--   end,
--   dependencies = { { 'nvim-tree/nvim-web-devicons' } },
-- })

-- local function make_custom_footer()
--   local default_footer = { '', 'Have fun with neovim' }
--   if packer_plugins ~= nil then
--     local count = #vim.tbl_keys(packer_plugins)
--     default_footer[2] = 'loaded ' .. count .. ' plugins'
--   end
--   return default_footer
-- end
--
-- dash.custom_footer = make_custom_footer

-- local hi = vim.api.nvim_set_hl
--
-- -- git gutter theme
-- -- hi(0, "GitSignsAdd", { fg = "#008D83", bg = "none" })
-- hi(0, 'GitGutterChange', { fg = '#845ec2', bg = 'none' })
-- -- hi(0, "DiffDelete", { fg = "#f0a0c0", bg = "#333333" })
--
-- --[[ hi(0, "DashboardHeader", { fg = "#ebbcba", bg = "none" }) -- rose pine, rose ]]
-- hi(0, 'DashboardCenter1Icon', { fg = '#696778', bg = 'none' })
-- hi(0, 'DashboardCenter3Icon', { fg = '#696778', bg = 'none' })
-- hi(0, 'DashboardCenter5Icon', { fg = '#696778', bg = 'none' })
-- hi(0, 'DashboardCenter7Icon', { fg = '#696778', bg = 'none' })
-- --[[ hi(0, "DashboardShortCut", { fg = "#696778", bg = "none" }) ]]
-- hi(0, 'DashboardFooter', { fg = '#696778', bg = 'none' })
-- hi(0, 'TelescopeBorder', { fg = '#ea9a97', bg = 'none' })
-- hi(0, 'TelescopePromptBorder', { fg = '#2a273f', bg = 'none' })
-- hi(0, 'TelescopeResultsBorder', { fg = '#2a273f', bg = 'none' })
-- hi(0, 'TelescopePreviewBorder', { fg = '#2a273f', bg = 'none' })
-- hi(0, 'TelescopeMatching', { fg = '#ea9a97', bg = 'none' })
-- hi(0, 'TelescopeNormal', { fg = '#9F9ABA', bg = 'none' })
-- -- command line
-- hi(0, 'MsgArea', { fg = '#696778', bg = 'none' })
--
-- -- search and replace border and lsp float, covered in rose pine setup
-- -- hi(0, "FloatBorder", { fg = "#008D83", bg = "#1F1D2F" })
--
-- -- neotree border
-- hi(0, 'NeoTreeBorder', { fg = '#ea9a97', bg = 'none' })
-- hi(0, 'NeoTreeFloatBorder', { fg = '#2a273f', bg = '#191724' })
--
-- -- barbar colors
-- -- hi(0, "BarbarStatusLine", { fg = "#696778", bg = "none" })
-- -- hi(0, "BarbarStatusLineFocused", { fg = "#696778", bg = "none" })
-- -- hi(0, "BarbarStatusLineSelected", { fg = "#696778", bg = "none" })
-- -- hi(0, "BarbarCurrentIcon", { fg = "#191724", bg = "#ebbcba" })
--

return {
  { 'nvim-lua/plenary.nvim', module = 'plenary' },
  { 'nvim-lua/popup.nvim', module = 'popup' },
  { 'romainl/vim-cool' }, -- disable search highlight on move
  { 'tpope/vim-surround' }, -- why not in vim core?
  { -- smooth scroll
    'declancm/cinnamon.nvim',
    config = function()
      require('cinnamon').setup()
    end,
  },

  { -- terminal
    'numToStr/FTerm.nvim',
    config = function()
      require('FTerm').setup({
        border = 'single',
        auto_close = false,
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      })
    end,
  },
}

-- better buffer deleter
-- use("famiu/bufdelete.nvim")

-- use({
--   'romgrk/barbar.nvim',
--   config = function()
--     require('bufferline').setup({
--       closable = true,
--       clickable = false,
--       icon_separator_inactive = '',
--       icon_separator_active = '',
--       icon_custom_colors = false,
--       icons = false,
--       icon_close_tab = '',
--       -- icon_close_tab_modified = "",
--       -- icon_close_tab_modified = "",
--       icon_close_tab_modified = '',
--       -- icon_close_tab_modified = "",
--       -- icon_close_tab_modified = "縷",
--       insert_at_end = true,
--       insert_at_start = false,
--       maximum_padding = 0,
--       no_name_title = '[nullish]',
--     })
--   end,
-- })

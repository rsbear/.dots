return {
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      vim.keymap.set('n', '<leader>so', '<cmd>SymbolsOutline<CR>', { desc = 'symbols outline' })
    end,
  },

  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup()
      vim.keymap.set('n', 't', '<cmd>:HopWord<CR>', { desc = 'hip hop' })
    end,
  },

  { -- search and replace
    'VonHeikemen/searchbox.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
    },
    config = function()
      -- vim.keymap.set('n', '<S-f>', '<cmd>lua require("searchbox").incsearch()<CR>', { desc = 'search box incremental search' })
      vim.keymap.set('n', '<leader>re', '<cmd>lua require("searchbox").replace()<CR>', { desc = 'find and replace' })
    end,
  },

  {
    'nvim-pack/nvim-spectre',
    config = function()
      require('spectre').setup()
      vim.keymap.set('n', '<S-f>', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = 'Toggle Spectre',
      })
      -- vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
      --   desc = '[s]earch current [w]ord',
      -- })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = '[s]earch current [w]ord',
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = '[s]earch on current file',
      })
    end,
  },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}

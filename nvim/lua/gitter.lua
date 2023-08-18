return {

  -- use({ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" })

  -- use("tpope/vim-fugitive")
  { 'tpope/vim-rhubarb' },

  {
    'dinhhuy258/git.nvim',
    config = function()
      require('git').setup({
        keymaps = {
          blame = '<leader>gb',
          browse = '<leader>go',
        },
      })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { hl = 'GitSignsAdd', text = '' },
          change = { hl = 'GitGutterChange', text = '' },
          delete = { hl = 'GitGutterDelete', text = '-' },
          topdelete = { hl = 'GitGutterDelete', text = '‾' },
          changedelete = { hl = 'GitGutterChange', text = '' },
        },
      })
    end,
  },
}

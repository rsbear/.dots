return {

  -- use({ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" })

  -- use("tpope/vim-fugitive")
  { 'tpope/vim-rhubarb' },

  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('neogit').setup({
        disable_commit_confirmation = true,
        sections = {
          untracked = {
            folded = true,
          },
          unstaged = {
            folded = true,
          },
          staged = {
            folded = true,
          },
          stashes = {
            folded = true,
          },
          unpulled = {
            folded = true,
          },
          unmerged = {
            folded = true,
          },
          recent = {
            folded = true,
          },
        },
        mappings = {
          status = {
            -- Adds a mapping with "B" as key that does the "BranchPopup" command
            ['B'] = 'BranchPopup',
            -- Removes the default mapping of "s"
            ['<leader>q'] = 'Close',
          },
        },
      })
    end,
  },

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
          add = { hl = 'GitSignsAdd', text = '│' },
          change = { hl = 'GitGutterChange', text = '│' },
          delete = { hl = 'GitGutterDelete', text = '_' },
          topdelete = { hl = 'GitGutterDelete', text = '‾' },
          changedelete = { hl = 'GitGutterChange', text = '~' },
        },
      })
    end,
  },
}

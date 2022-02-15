return function()
  require('git').setup {
    keymaps = {
      blame = '<leader>gb',
      browse = '<leader>go',
    },
  }
end

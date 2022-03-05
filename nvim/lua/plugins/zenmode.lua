return function()
  require('zen-mode').setup {
    window = {
      backdrop = 1,
    },
    plugins = {
      twilight = { enabled = false },
    },
  }
end

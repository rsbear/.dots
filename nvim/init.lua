-- MAP SPACE TO LEADER
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<space>', '<nop>', { silent = true })
-- require("impatient")

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('options')
require('lazy').setup({
  require('system'),
  require('interface'),
  require('completions'),
  require('gitter'),
  require('search'),
  require('lspp'),
})
require('keymaps').core_keymaps()
require('keymaps').plugin_keymaps()
require('autocommands').setup()

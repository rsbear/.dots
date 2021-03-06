-- MAP SPACE TO LEADER
vim.g.mapleader = " "
vim.keymap.set("n", "<space>", "<nop>", { silent = true })
require("impatient")

require("rs-ui")
require("rs-core")
require("rs-lsp")
require("rs-completions")
require("rs-git")
require("rs-extras")
require("rs-search")

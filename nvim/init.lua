-- local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
-- end

-- require("packer").startup(function(use)
-- end)

-- MAP SPACE TO LEADER
vim.g.mapleader = " "
vim.keymap.set("n", "<space>", "<nop>", { silent = true })
-- require("impatient")

require("rs-ui")
require("rs-core")
require("rs-lsp")
require("rs-completions")
require("rs-git")
require("rs-extras")
require("rs-search")


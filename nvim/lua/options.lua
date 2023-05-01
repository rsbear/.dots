local o = vim.opt

o.inccommand = 'nosplit'

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

o.hlsearch = true
o.hidden = true
o.mouse = 'a'
o.breakindent = true
o.updatetime = 100
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.relativenumber = false

o.undofile = true
o.swapfile = false -- disable swap
o.writebackup = false -- disable backup
o.backup = false -- disable backup
o.backupcopy = 'yes' -- fix weirdness for stuff that replaces the entire file when hot reloading
o.laststatus = 0
o.scrolloff = 8

-- required for modes plugin
o.cursorline = true

-- disable ~ at end of buffer
o.fcs = 'eob: '

vim.wo.number = true
vim.wo.signcolumn = 'yes'

-- fugitive husky fix
vim.g.fugitive_pty = 0

vim.g.copilot_no_tab_map = true

o.diffopt:append({ 'algorithm:histogram', 'indent-heuristic' })

o.completeopt = 'menu,menuone,noselect'

o.winbar = '%=%f%m%r%h%w'

-- Concat values to line above
o.shortmess = o.shortmess
  + {
    A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
    I = true, -- don't give the intro message when starting Vim |:intro|.
    W = true, -- don't give "written" or "[w]" when writing a file
    c = true, -- don't give |ins-completion-menu| messages
    m = true, -- use "[+]" instead of "[Modified]"
  }

-- lsp shit
vim.diagnostic.config({ virtual_text = false, underline = true })
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

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

o.undofile = true
o.swapfile = false -- disable swap
o.writebackup = false -- disable backup
o.backup = false -- disable backup
o.backupcopy = 'yes' -- fix weirdness for stuff that replaces the entire file when hot reloading

vim.wo.number = true
vim.wo.signcolumn = 'yes'

-- fugitive husky fix
vim.g.fugitive_pty = 0

vim.g.copilot_no_tab_map = true

o.diffopt:append { 'algorithm:histogram', 'indent-heuristic' }

o.completeopt = {
  'menu',
  'menuone',
  'noselect',
  'noinsert',
}

-- Concat values to line above
o.shortmess = o.shortmess
  + {
    A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
    I = true, -- don't give the intro message when starting Vim |:intro|.
    W = true, -- don't give "written" or "[w]" when writing a file
    c = true, -- don't give |ins-completion-menu| messages
    m = true, -- use "[+]" instead of "[Modified]"
  }

o.formatoptions = o.formatoptions
 - 'a' -- Auto formatting is BAD.
 - 't' -- Don't auto format my code. I got linters for that.
 + 'c' -- In general, I like it when comments respect textwidth
 + 'q' -- Allow formatting comments w/ gq
 - 'o' -- O and o, don't continue comments
 + 'r' -- But do continue when pressing enter.
 + 'n' -- Indent past the formatlistpat, not underneath it.
 + 'j' -- Auto-remove comments if possible.
 - '2' -- I'm not in gradeschool anymore

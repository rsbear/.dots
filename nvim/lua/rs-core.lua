local opts = { silent = true, noremap = true }
local km = vim.keymap.set

local function telemap(key, cmd)
	km("n", key, '<cmd>lua require("telescope.builtin").' .. cmd .. "<CR>", opts)
end

local function troublemap(key, cmd)
	km("n", key, "<cmd>Trouble " .. cmd .. "<CR>", opts)
end

-- TELESCOPE
telemap("<C-p>", "find_files()")
telemap("<leader>ff", "git_files()")
telemap("<C-f>", "git_files()")
telemap("<leader>fb", "current_buffer_fuzzy_find()")
telemap("<leader>fg", "live_grep()")
telemap("<leader>fw", "grep_string({ search = vim.fn.input('GREP FOR WORD > '), theme = 'ivy' })")
telemap("<leader>gs", "git_status()")
telemap("<leader>gc", "git_commits()")
telemap("<leader>k", "keymaps()")
telemap("<leader>b", "buffers()")
telemap("<leader>en", "find_files({ cwd = '~/.config' })")
telemap("<C-q>", "quickfix()")

-- TROUBLE
troublemap("<leader>tw", "workspace_diagnostics")
troublemap("<leader>tl", "loclist")
troublemap("<leader>tq", "quickfix")
troublemap("gr", "lsp_references")

-- LSP SAGA
km("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
km("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
-- km("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- map("n", "?", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- map("n", "<leader>h", "<Cmd>Lspsaga signature_help<CR>", { silent = true, noremap = true })

-- SYMBOLS OUTLINE
km("n", "<leader>s", "<cmd>SymbolsOutline<CR>", opts)

-- NEOGIT
km("n", "<leader>gg", "<cmd>:Neogit<cr>", opts)

-- find replacer
km("n", "<S-f>", '<cmd>lua require("searchbox").incsearch()<CR>', opts)
km("n", "<leader>re", '<cmd>lua require("searchbox").replace()<CR>', opts)

-- HOP
km("n", "s", "<cmd>:HopWord<CR>")

-- FLOAT TERM
km("n", "<leader>m", "<cmd>lua require('FTerm').toggle()<cr>", { noremap = true })
km("t", "<leader>m", "<cmd>lua require('FTerm').toggle()<cr>", { noremap = true })

-- COLOR PICKER
km("n", "<leader>cp", "<cmd>PickColor<cr>", opts)
km("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- SYSTEM CLIPBOARD
km("n", "<leader>y", '"+y', opts)
km("v", "<leader>y", '"+y', opts)
km("n", "<leader>yy", '"+y', opts)
km("n", "Y", "y$", { noremap = true })

-- NEO TREE
km("n", "<leader><space>", ":NeoTreeFloatToggle<CR>", opts)

-- copilot
km("i", "<C-h>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })

-- Move lines up and down
km("n", "<S-up>", "<cmd>:m-2<CR>", opts)
km("i", "<S-up>", "<cmd>:m-2<CR>", opts)
km("n", "<S-Down>", "<cmd>:m+<CR>", opts)
km("i", "<S-Down>", "<cmd>:m+<CR>", opts)

-- buffer manager
km("n", "<C-=>", "<cmd>:vert sb#<CR>", opts)
km("n", "<leader><BS>", "<cmd>:Bdelete<CR>", opts)
km("n", "<C-BS>", "<cmd>:Bdelete<CR>", opts)

-- map("n", "<C-right>", "<cmd>:bprev<CR>")
-- map("n", "<C-left>", "<cmd>:bnext<CR>")

-- barbar
km("n", "<C-right>", "<cmd>:BufferNext<CR>", opts)
km("n", "<C-]>", "<cmd>:BufferNext<CR>", opts)
km("n", "<C-left>", "<cmd>:BufferPrevious<CR>", opts)
km("n", "<C-[>", "<cmd>:BufferPrevious<CR>", opts)
km("n", "<leader>1", "<cmd>:BufferFirst<CR>", opts)

-- indenters
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

--Remap for dealing with word wrap
km("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
km("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

local o = vim.opt

o.inccommand = "nosplit"

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

o.hlsearch = true
o.hidden = true
o.mouse = "a"
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
o.backupcopy = "yes" -- fix weirdness for stuff that replaces the entire file when hot reloading
o.laststatus = 0
o.scrolloff = 8

-- required for modes plugin
o.cursorline = true

-- disable ~ at end of buffer
o.fcs = "eob: "

vim.wo.number = true
vim.wo.signcolumn = "yes"

-- fugitive husky fix
vim.g.fugitive_pty = 0

vim.g.copilot_no_tab_map = true

o.diffopt:append({ "algorithm:histogram", "indent-heuristic" })

o.completeopt = "menu,menuone,noselect"

-- Concat values to line above
o.shortmess = o.shortmess
	+ {
		A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
		I = true, -- don't give the intro message when starting Vim |:intro|.
		W = true, -- don't give "written" or "[w]" when writing a file
		c = true, -- don't give |ins-completion-menu| messages
		m = true, -- use "[+]" instead of "[Modified]"
	}

-- Stop 'o' continuing comments
vim.api.nvim_create_autocmd("BufEnter", {
	command = "setlocal formatoptions-=o",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- organize go imports
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		local params = vim.lsp.util.make_range_params()
		local wait_ms = 1000
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit)
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})

local function get_listed_buffers()
	local len = 0
	for buffer = 1, vim.fn.bufnr("$") do
		if vim.fn.buflisted(buffer) == 1 then
			len = len + 1
		end
	end

	return len
end

-- depends on famiu/bufdelete.nvim
-- adapted to be short sighted from
-- https://github.com/goolord/alpha-nvim/discussions/85#discussioncomment-2798017
vim.api.nvim_create_augroup("dashboard_on_empty", { clear = true })
vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "BDeletePre",
	group = "dashboard_on_empty",
	callback = function()
		local len = get_listed_buffers()

		if len == 1 then
			vim.cmd([[:Dashboard]])
		end
	end,
})

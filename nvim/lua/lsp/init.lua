local export = {}

function export.init()

	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup({
		ensure_installed = {}
	})

	local lsp_opts = {
		on_attach = require("keymaps").lsp_on_attach,
	}

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	mason_lspconfig.setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup(lsp_opts)
		end,
		["sumneko_lua"] = function()
			require("lspconfig").sumneko_lua.setup(vim.tbl_deep_extend("force", lsp_opts, {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				}
			}))
		end,
		["tailwindcss"] = function()
			require("lspconfig").tailwindcss.setup(vim.tbl_deep_extend("force", lsp_opts, {
				filetypes = { "typescriptreact", "astro", "javascriptreact" },
				root_dir = require("lspconfig").util.root_pattern({ "tailwind.config.js", "tailwind.config.cjs" }),
			}))
		end,
		["denols"] = function()
			require("lspconfig").denols.setup(vim.tbl_deep_extend("force", lsp_opts, {
				root_dir = require("lspconfig").util.root_pattern({ "deno.json", "import_map.json", "mod.ts" }),
			}))
		end,
		["cssls"] = function()
			require("lspconfig").cssls.setup(vim.tbl_deep_extend("force", lsp_opts, {
				capabilities = capabilities,
				settings = {
					css = {
						validate = true,
					},
					scss = {
						validate = true,
					},
				},
			}))
		end,
		["tsserver"] = function()
			require("lspconfig").tsserver.setup(vim.tbl_deep_extend("force", lsp_opts, {
				root_dir = require("lspconfig").util.root_pattern({ "package.json", "yarn.lock", "package-lock.json" }),
				settings = {
					update_on_insert = false
				},
				-- 			handlers = {
				-- 				["textDocument/definition"] = function(err, result, method, ...)
				-- 					if vim.tbl_islist(result) and #result > 1 then
				-- 						local filtered_result = filter(result, filterReactDTS)
				-- 						return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
				-- 					end
				--
				-- 					vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
				-- 				end,
				-- 			},
			}))
		end,

	})

end

return export



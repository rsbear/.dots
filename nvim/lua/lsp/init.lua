return function()
	local lspconfig = require("lspconfig")

	local on_attach = require("lsp.on_attach")
	local format_config = require("lsp.format")
	require("lsp.ui").setup()

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local function filter(arr, fn)
		if type(arr) ~= "table" then
			return arr
		end

		local filtered = {}
		for k, v in pairs(arr) do
			if fn(v, k, arr) then
				table.insert(filtered, v)
			end
		end

		return filtered
	end

	local function filterReactDTS(value)
		return string.match(value.targetUri, "%.d.ts") == nil
	end

	local servers = {
		efm = {
			filetypes = vim.tbl_keys(format_config),
			init_options = { documentFormatting = true },
			settings = {
				languages = format_config,
			},
		},
		sumneko_lua = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
		tailwindcss = {
			filetypes = { "typescriptreact", "astro", "javascriptreact" },
			root_dir = lspconfig.util.root_pattern({ "tailwind.config.js", "tailwind.config.cjs" }),
		},
		svelteserver = {
			filetypes = { "html", "svelte" },
		},
		tsserver = {
			root_dir = lspconfig.util.root_pattern({ "package.json", "yarn.lock", "package-lock.json" }),
			handlers = {
				["textDocument/definition"] = function(err, result, method, ...)
					if vim.tbl_islist(result) and #result > 1 then
						local filtered_result = filter(result, filterReactDTS)
						return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
					end

					vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
				end,
			},
		},
		denols = {
			root_dir = lspconfig.util.root_pattern({ "deno.json", "import_map.json", "mod.ts" }),
		},
		cssls = {
			capabilities = capabilities,
			settings = {
				css = {
					validate = true,
				},
				scss = {
					validate = true,
				},
			},
		},
		gopls = {
			settings = {
				gopls = {
					codelenses = {
						references = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						generate = true,
					},
					gofumpt = true,
				},
			},
		},
	}

	local function get_config(server_name)
		local config = servers[server_name] or {}

		if package.loaded["cmp_nvim_lsp"] then
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		end

		config.on_attach = on_attach

		return config
	end

	require("nvim-lsp-installer").on_server_ready(function(server)
		server:setup(get_config(server.name))
	end)
end

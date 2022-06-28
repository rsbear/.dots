local dprint = {
	formatCommand = "dprint fmt --stdin ${INPUT}",
	formatStdin = true,
}

local prettier = {
	formatCommand = "prettierd ${INPUT}",
	formatStdin = true,
}

-- testing rome
-- local rome = {
--   formatCommand = './node_modules/.bin/rome format .',
--   formatStdin = true,
-- }

local stylua = {
	formatCommand = "stylua -s -",
	formatStdin = true,
}

return {
	css = { prettier },
	graphql = { prettier },
	javascript = { prettier },
	javascriptreact = { prettier },
	json = { prettier },
	lua = { stylua },
	-- markdown = { prettier },
	scss = { prettier },
	typescript = { prettier },
	typescriptreact = { prettier },
	-- svelte = { projectPathPrettier },
	yaml = { prettier },
}

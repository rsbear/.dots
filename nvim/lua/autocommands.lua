local export = {}

function export.setup()
  -- Stop 'o' continuing comments
  -- vim.api.nvim_create_autocmd("BufEnter", {
  -- 	command = "setlocal formatoptions-=o",
  -- })

  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
  })

  -- organize go imports
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.go' },
    callback = function()
      local params = vim.lsp.util.make_range_params()
      local wait_ms = 1000
      params.context = { only = { 'source.organizeImports' } }
      local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, wait_ms)
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
    for buffer = 1, vim.fn.bufnr('$') do
      if vim.fn.buflisted(buffer) == 1 then
        len = len + 1
      end
    end

    return len
  end

  -- depends on famiu/bufdelete.nvim
  -- adapted to be short sighted from
  -- https://github.com/goolord/alpha-nvim/discussions/85#discussioncomment-2798017
  vim.api.nvim_create_augroup('dashboard_on_empty', { clear = true })
  vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = 'BDeletePre',
    group = 'dashboard_on_empty',
    callback = function()
      local len = get_listed_buffers()

      if len == 1 then
        vim.cmd([[:Dashboard]])
      end
    end,
  })
end

return export

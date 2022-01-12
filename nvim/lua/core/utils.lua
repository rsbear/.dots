local M = {}

function P(cmd)
  print(vim.inspect(cmd))
end

function _G.safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify(string.format('Error requiring: %s', module), vim.log.levels.ERROR)
    return ok
  end
  return result
end

-- Os
M.os = {
  home = os.getenv 'HOME',
  data = vim.fn.stdpath 'data',
  cache = vim.fn.stdpath 'cache',
  config = vim.fn.stdpath 'config',
  name = vim.loop.os_uname().sysname,
  is_git_dir = os.execute 'git rev-parse --is-inside-work-tree >> /dev/null 2>&1',
}

-- Mappings
M.keymap = {}
function M.keymap.buf_map(mode, key, cmd, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, options)
end

function M.keymap.map(mode, key, cmd, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, cmd, options)
end

return M

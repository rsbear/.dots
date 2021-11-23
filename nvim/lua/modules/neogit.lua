return function()
  local neo = require 'neogit'

  neo.setup {
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = true,
    auto_refresh = true,
    disable_builtin_notifications = false,
    -- commit_popup = {
    --   kind = 'floating',
    -- },
  }
end

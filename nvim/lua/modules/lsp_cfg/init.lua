return function()
  require 'modules.lsp_cfg.css'
  -- require 'modules.lsp_cfg.go'
  require 'modules.lsp_cfg.graphql'
  require 'modules.lsp_cfg.lua'
  require 'modules.lsp_cfg.tailwind'
  require 'modules.lsp_cfg.ts'
  require 'modules.lsp_cfg.efm'
end


-- A little note, theres an on_attach file/func
-- its just lsp binds thats all
-- for prettier-able file types disable formatting
-- and use efm

return function()
  local cmp = require 'cmp'
  local lspkind = require 'lspkind'
  local snippets = require 'luasnip'

  cmp.setup {
    snippet = {
      expand = function(args)
        snippets.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm { select = true },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif snippets.expand_or_jumpable() then
          snippets.expand_or_jump()
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif snippets.jumpable(-1) then
          snippets.jump(-1)
        else
          fallback()
        end
      end),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer', max_item_count = 10 },
    }),
    formatting = {
      format = lspkind.cmp_format {
        with_text = false,
        menu = {
          buffer = '[buf]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[api]',
          path = '[path]',
          luasnip = '[snip]',
        },
      },
    },
  }
end

return {
  { 'github/copilot.vim' },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local icons = {
        Text = ' ',
        Method = ' ',
        Function = ' ',
        Constructor = '⌘ ',
        Field = 'ﰠ ',
        Variable = ' ',
        Class = 'ﴯ',
        Interface = ' ',
        Module = ' ',
        Property = 'ﰠ ',
        Unit = '塞 ',
        Value = ' ',
        Enum = ' ',
        Keyword = '廓 ',
        Snippet = ' ',
        Color = ' ',
        File = ' ',
        Reference = ' ',
        Folder = ' ',
        EnumMember = ' ',
        Constant = ' ',
        Struct = 'פּ ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
      }

      cmp.setup({
        window = { -- rounded border; thin-style scrollbar
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          -- ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({
            select = true, -- was true before copilot cmp
            behavior = cmp.ConfirmBehavior.Replace,
          }),
          ['\\'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            'i',
            's',
          }),
          ['<C-a>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          -- { name = 'copilot', group_index = 1 },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          -- insert_text = require("copilot_cmp.format").remove_existing,
          format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = icons[vim_item.kind]

            return vim_item
          end,
        },
      })
    end,
  },

  { 'saadparwaiz1/cmp_luasnip' },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      local ls = require('luasnip')
      -- some shorthands...
      local s = ls.snippet
      local i = ls.insert_node
      local ps = ls.parser.parse_snippet
      local rep = require('luasnip.extras').rep
      local fmt = require('luasnip.extras.fmt').fmt

      -- Every unspecified option will be set to the default.
      ls.config.set_config({
        history = true,
        update_events = 'TextChanged,TextChangedI',
        delete_check_events = 'TextChanged',
      })

      ls.add_snippets('typescript', {
        ps('impor', 'import {$0} from "$1";'),
        ps('fn', 'function $1($2) {\n $0\n}'),
        ps('fun', 'function $1($2) {\n $0\n}'),
        ps('func', 'function $1($2) {\n $0\n}'),
        ps('fna', 'async function $1($2) {\n $0\n}'),
        ps('arrow', 'const $1 = ($2) => {\n $0\n}'),
        ps('arrowa', 'const $1 = async ($2) => {\n $0\n}'),
        ps('cb', '($1) => $0'),
        ps('interf', 'interface $1 {\n$0\n}'),
        -- ps('clg', "console.log('$1 --', $1);$0"),
        ps('state', 'const [$1, $2] = useState($0);'),
        ps('useeffect', 'useEffect(() => {\n  $0\n}, [])'),
        ps('clg', 'console.log({ $0 })'),
      })

      ls.add_snippets('typescriptreact', {
        ps('impor', 'import {$0} from "$1";'),
        ps('fn', 'function $1($2) {\n $0\n}'),
        ps('fun', 'function $1($2) {\n $0\n}'),
        ps('func', 'function $1($2) {\n $0\n}'),
        ps('fna', 'async function $1($2) {\n $0\n}'),
        ps('arrow', 'const $1 = ($2) => {\n $0\n}'),
        ps('arrowa', 'const $1 = async ($2) => {\n $0\n}'),
        ps('cb', '($1) => $0'),
        -- ps('clg', "console.log('$1 --', $2);$0"),
        ps('interf', 'interface $1 {\n$0\n}'),
        ps('state', 'const [$1, $2] = useState($0);'),
        ps('useeff', 'useEffect(() => {\n  $1\n}, [$0])'),
        ps('div', '<div>\n$0\n</div>'),
        ps('divc', '<div className="$1">\n$0\n</div>'),
        ps('h1', '<h1>$0</h1>'),
        ps('h1c', '<h1 className="$1">$0</h1>'),
        ps('h2', '<h2>$0</h2>'),
        ps('h3', '<h3>$0</h3>'),
        ps('h4', '<h4>$0</h4>'),
        ps('h5', '<h5>$0</h5>'),
        ps('h6', '<h6>$0</h6>'),
        ps('p', '<p>$0</p>'),
        ps('ul', '<ul>\n$0\n</ul>'),
        ps('li', '<li>\n$0\n</li>'),
        ps('span', '<span>$0</span>'),
        ps('input', '<input className="$1" placeholder="$2" onChange={$0} />'),
        ps('button', '<button type="button" className="$1" onClick={$2}>$0</button>'),
        ps('class', 'className="$0"'),
        ps(
          'rfc',
          'import type { FC } from "react"\n\nexport const $1:FC = () => {\n  return(\n    <div>\n$0\n</div>)}\n'
        ),
        ps('rcc', 'export function $1($2) {\n\n  return(\n    <div>\n$0\n    </div>\n  )\n}'),
        ps(
          'rfp',
          'import type { NextPage } from "next"\n\nconst $1:NextPage = () => {\n  return(\n    <div>\n$0\n</div>)}\n\nexport default $2'
        ),
        ps(
          'gssp',
          'export const getServerSideProps: GetServerSideProps = async (ctx) => {\n  return {\n    props: {}  \n  }\n}\n\n'
        ),
        ps('clg', 'console.log({ $0 })'),
      })

      ls.add_snippets('svelte', {
        ps('impor', 'import {$0} from "$1";'),
        ps('fn', 'function $1($2) {\n $0\n}'),
        ps('fun', 'function $1($2) {\n $0\n}'),
        ps('func', 'function $1($2) {\n $0\n}'),
        ps('fna', 'async function $1($2) {\n $0\n}'),
        ps('arrow', 'const $1 = ($2) => {\n $0\n}'),
        ps('arrowa', 'const $1 = async ($2) => {\n $0\n}'),
        ps('cb', '($1) => $0'),
        -- ps('clg', "console.log('$1 --', $2);$0"),
        ps('interf', 'interface $1 {\n$0\n}'),
        ps('div', '<div>\n$0\n</div>'),
        ps('divc', '<div class="$1">\n$0\n</div>'),
        ps('h1', '<h1>$0</h1>'),
        ps('h1c', '<h1 class="$1">$0</h1>'),
        ps('h2', '<h2>$0</h2>'),
        ps('h3', '<h3>$0</h3>'),
        ps('h4', '<h4>$0</h4>'),
        ps('h5', '<h5>$0</h5>'),
        ps('h6', '<h6>$0</h6>'),
        ps('p', '<p>$0</p>'),
        ps('ul', '<ul>\n$0\n</ul>'),
        ps('ol', '<ol>\n$0\n</0l>'),
        ps('li', '<li>\n$0\n</li>'),
        ps('span', '<span>$0</span>'),
        ps('input', '<input class="$1" placeholder="$2" onChange={$0} />'),
        ps('button', '<button type="button" class="$1" onClick={$2}>$0</button>'),
        ps('class', 'class="$0"'),
        ps('script', '<script lang="ts">\n  $0\n</script>'),
        ps('clg', 'console.log({ $0 })'),
      })
    end,
  },
}

-- use({
-- 	branch = "coq",
-- 	"ms-jpq/coq_nvim",
-- })

-- use {
--   "zbirenbaum/copilot.lua",
--   event = "VimEnter",
--   config = function()
--     vim.defer_fn(function()
--       require("copilot").setup({
-- 				server_opts_overrides = {
-- 					trace = "verbose",
-- 					settings = {
-- 						advanced = {
-- 							listCount = 10, -- #completions for panel
-- 							inlineSuggestCount = 3, -- #completions for getCompletions
-- 							indentationMode = {
-- 								typescript = "client",
-- 								javascript = "client",
-- 							}
-- 						}
-- 					},
-- 				}
-- 			})
--     end, 100)
--   end,
-- }
--
-- use {
--   "zbirenbaum/copilot-cmp",
--   after = { "copilot.lua" },
--   config = function ()
--     require("copilot_cmp").setup({
-- 			method = "getCompletionsCycling",
-- 			formatters = {
-- 				label = require("copilot_cmp.format").format_label_text,
-- 				insert_text = require("copilot_cmp.format").format_insert_text,
-- 				preview = require("copilot_cmp.format").deindent,
-- 			},
-- 		})
--   end
-- }

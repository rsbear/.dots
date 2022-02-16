return function()
  local ls = require 'luasnip'
  -- some shorthands...
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local parsnip = ls.parser.parse_snippet
  local rep = require('luasnip.extras').rep
  local fmt = require('luasnip.extras.fmt').fmt

  -- Every unspecified option will be set to the default.
  ls.config.set_config {
    history = false,
    updateevents = 'TextChanged,TextChangedI',
  }

  -- args is a table, where 1 is the text in Placeholder 1, 2 the text in
  -- placeholder 2,...
  local function copy(args)
    return args[1]
  end

  -- 'recursive' dynamic snippet. Expands to some text followed by itself.
  local rec_ls
  rec_ls = function()
    return sn(
      nil,
      c(1, {
        -- Order is important, sn(...) first would cause infite loop of expansion.
        t '',
        sn(nil, { t { '', '\t\\item ' }, i(1), d(2, rec_ls, {}) }),
      })
    )
  end

  -- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
  local function bash(_, command)
    local file = io.popen(command, 'r')
    local res = {}
    for line in file:lines() do
      table.insert(res, line)
    end
    return res
  end

  ls.snippets = {
    typescript = {
      parsnip('imp', 'import {$0} from "$1";'),
      parsnip('fun', 'function $1($2) {\n $0\n}'),
      parsnip('int', 'interface $1 {\n$0\n}'),
      parsnip('clg', "console.log('$1 --', $1);$0"),
      parsnip('state', 'const [$1, $2] = useState($0);'),
      parsnip('eff', 'useEffect(() => {\n  $0\n}, [])'),
      -- s('clg', fmt("console.log('{}', {})", { rep(1), i(1) })),
    },
    typescriptreact = {
      parsnip('imp', 'import {$0} from "$1";'),
      parsnip('fun', 'function $1($2) {\n $0\n}'),
      parsnip('clg', "console.log('$1 --', $1);$0"),
      parsnip('int', 'interface $1 {\n$0\n}'),
      parsnip('state', 'const [$1, $2] = useState($0);'),
      parsnip('eff', 'useEffect(() => {\n  $0\n}, [])'),
      parsnip('div', '<div>$0</div>'),
      parsnip('divc', '<div className="$1">$0</div>'),
      parsnip('h1', '<h1>$0</h1>'),
      parsnip('h1c', '<h1 className="$1">$0</h1>'),
      parsnip('h2', '<h2>$0</h2>'),
      parsnip('h3', '<h3>$0</h3>'),
      parsnip('h4', '<h4>$0</h4>'),
      parsnip('h5', '<h5>$0</h5>'),
      parsnip('h6', '<h6>$0</h6>'),
      parsnip('p', '<p>$0</p>'),
      parsnip('span', '<span>$0</span>'),
      parsnip('input', '<input className="$1" placeholder="$2" onChange={$0} />'),
      parsnip('button', '<button className="$1" onClick={$2} type="button">$0</button>'),
      -- s('clg', fmt("console.log('{}', {})", { rep(1), i(1, 'defult') })),
    },
    all = {

      s('rfc', {
        t { "import { FC } from 'react'", '\t' },
        t 'const ',
        i(1),
        t { ' :FC<any> = () => {', '\t' },
        t '\t',
        t { 'return (', '\t' },
        t { '<div>', '\t' },
        t { '<h1>' },
        t { '\t' },
        t { '</h1>', '\t' },
        t { '</div>', '\t' },
        t { ')' },
        t { '}', '\t' },
        t { 'export default ' },
      }),
    },
  }
end

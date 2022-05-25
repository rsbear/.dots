return function()
  local ls = require('luasnip')
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
  ls.config.set_config({
    history = true,
    update_events = 'TextChanged,TextChangedI',
    delete_check_events = 'TextChanged',
  })

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
        t(''),
        sn(nil, { t({ '', '\t\\item ' }), i(1), d(2, rec_ls, {}) }),
      })
    )
  end

  ls.add_snippets('typescript', {
    parsnip('impor', 'import {$0} from "$1";'),
    parsnip('fn', 'function $1($2) {\n $0\n}'),
    parsnip('func', 'function $1($2) {\n $0\n}'),
    parsnip('cb', '($1) => $0'),
    parsnip('inter', 'interface $1 {\n$0\n}'),
    -- parsnip('clg', "console.log('$1 --', $1);$0"),
    parsnip('state', 'const [$1, $2] = useState($0);'),
    parsnip('useeff', 'useEffect(() => {\n  $0\n}, [])'),
    s('clg', fmt("console.log('{}', {})", { rep(1), i(1) })),
  })

  ls.add_snippets('typescriptreact', {
    parsnip('impor', 'import {$0} from "$1";'),
    parsnip('fun', 'function $1($2) {\n $0\n}'),
    parsnip('func', 'function $1($2) {\n $0\n}'),
    parsnip('cb', '($1) => $0'),
    -- parsnip('clg', "console.log('$1 --', $2);$0"),
    parsnip('inter', 'interface $1 {\n$0\n}'),
    parsnip('state', 'const [$1, $2] = useState($0);'),
    parsnip('useeff', 'useEffect(() => {\n  $1\n}, [$0])'),
    parsnip('div', '<div>\n$0\n</div>'),
    parsnip('divc', '<div className="$1">\n$0\n</div>'),
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
    parsnip(
      'rfc',
      'import { FC } from "react"\n\nconst $1:FC = () => {\n  return(\n    <div>\n$0\n</div>)}\n\nexport default $2'
    ),
    s('clg', fmt("console.log('{}', {})", { rep(1), i(1) })),
  })
end

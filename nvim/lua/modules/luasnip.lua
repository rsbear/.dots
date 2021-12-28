return function()
  local ls = require 'luasnip'
  -- some shorthands...
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local l = require('luasnip.extras').lambda
  local r = require('luasnip.extras').rep
  local p = require('luasnip.extras').partial
  local m = require('luasnip.extras').match
  local n = require('luasnip.extras').nonempty
  local dl = require('luasnip.extras').dynamic_lambda

  -- Every unspecified option will be set to the default.
  ls.config.set_config {
    history = true,
    -- Update more often, :h events for more info.
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

  local function jdocsnip(args, old_state)
    local nodes = {
      t { '/**', ' * ' },
      i(1, 'A short Description'),
      t { '', '' },
    }

    -- These will be merged with the snippet; that way, should the snippet be updated,
    -- some user input eg. text can be referred to in the new snippet.
    local param_nodes = {}

    if old_state then
      nodes[2] = i(1, old_state.descr:get_text())
    end
    param_nodes.descr = nodes[2]

    -- At least one param.
    if string.find(args[2][1], ', ') then
      vim.list_extend(nodes, { t { ' * ', '' } })
    end

    local insert = 2
    for indx, arg in ipairs(vim.split(args[2][1], ', ', true)) do
      -- Get actual name parameter.
      arg = vim.split(arg, ' ', true)[2]
      if arg then
        local inode
        -- if there was some text in this parameter, use it as static_text for this new snippet.
        if old_state and old_state[arg] then
          inode = i(insert, old_state['arg' .. arg]:get_text())
        else
          inode = i(insert)
        end
        vim.list_extend(nodes, { t { ' * @param ' .. arg .. ' ' }, inode, t { '', '' } })
        param_nodes['arg' .. arg] = inode

        insert = insert + 1
      end
    end

    if args[1][1] ~= 'void' then
      local inode
      if old_state and old_state.ret then
        inode = i(insert, old_state.ret:get_text())
      else
        inode = i(insert)
      end

      vim.list_extend(nodes, { t { ' * ', ' * @return ' }, inode, t { '', '' } })
      param_nodes.ret = inode
      insert = insert + 1
    end

    if vim.tbl_count(args[3]) ~= 1 then
      local exc = string.gsub(args[3][2], ' throws ', '')
      local ins
      if old_state and old_state.ex then
        ins = i(insert, old_state.ex:get_text())
      else
        ins = i(insert)
      end
      vim.list_extend(nodes, { t { ' * ', ' * @throws ' .. exc .. ' ' }, ins, t { '', '' } })
      param_nodes.ex = ins
      insert = insert + 1
    end

    vim.list_extend(nodes, { t { ' */' } })

    local snip = sn(nil, nodes)
    -- Error on attempting overwrite.
    snip.old_state = param_nodes
    return snip
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
    all = {
      -- trigger is fn.
      s('fn', {
        t { '', 'function ' },
        -- Placeholder/Insert.
        i(1),
        t '(',
        -- Placeholder with initial text.
        i(2, 'arg'),
        -- Linebreak
        t { ') {', '\t' },
        -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
        i(0),
        t { '', '}' },
      }),

      s('clg', {
        t { 'console.log(' },
        t '{',
        i(1),
        t '})',
      }),

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

      s('div', {
        t { '<div >' },
        i(1),
        t '\t',
        t '</div>',
      }),

      s('p', {
        t { '<p >' },
        i(1),
        t '\t',
        t '</p>',
      }),

      s('span', {
        t { '<span >' },
        i(1),
        t '\t',
        t '</span>',
      }),

      s('button', {
        t { "<button type='button' onClick={} >" },
        i(1),
        t '\t',
        t '</button>',
      }),

      s('a', {
        t { '<a >' },
        i(1),
        t '\t',
        t '</a>',
      }),

      s('h1', {
        t { '<h1 >' },
        i(1),
        t '\t',
        t '</h1>',
      }),

      s('h2', {
        t { '<h2 >' },
        i(1),
        t '\t',
        t '</h2>',
      }),

      s('h3', {
        t { '<h3 >' },
        i(1),
        t '\t',
        t '</h3>',
      }),

      s('h4', {
        t { '<h4 >' },
        i(1),
        t '\t',
        t '</h4>',
      }),

      s('h5', {
        t { '<h5 >' },
        i(1),
        t '\t',
        t '</h5>',
      }),

      s('h6', {
        t { '<h6 >' },
        i(1),
        t '\t',
        t '</h6>',
      }),

      s('input', {
        t { '<input onChange={} ' },
        t { "placeholder='" },
        i(1),
        t { "' />" },
      }),

      s('tg', {
        t { '<' },
        i(1),
        t { '></' },
        i(0),
        t { '>' },
      }),
    },
  }

  --[[
-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.
-- Mind that this will extend  `ls.snippets` so you need to do it after your own snippets or you
-- will need to extend the table yourself instead of setting a new one.
]]

  -- TODO figure out why this doesnt work lol
  -- require("luasnip/loaders/from_vscode").load({ paths = { "./snippets" } }) -- Load snippets from my-snippets folder

  -- You can also use lazy loading so you only get in memory snippets of languages you use
  -- require("luasnip/loaders/from_vscode").lazy_load() -- You can pass { path = "./my-snippets/"} as wellni
end

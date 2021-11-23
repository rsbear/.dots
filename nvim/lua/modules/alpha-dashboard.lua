return function()
  local alpha = require 'alpha'
  local dashboard = require 'alpha.themes.dashboard'

  dashboard.section.header.val = {
    [[                                                                              ]],
    [[                                    ██████                                    ]],
    [[                                ████▒▒▒▒▒▒████                                ]],
    [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
    [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
    [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
    [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
    [[                        ██      ██      ████      ████                        ]],
    [[                                                                              ]],
    [[                                                                              ]],
  }

  dashboard.section.buttons.val = {
    dashboard.button('n', '   notes', ':e ~/Documents/vimnotes.md <BAR>:Goyo <CR>'),
    dashboard.button('r', '   recents', '<cmd>:Telescope oldfiles<CR>'),
    dashboard.button('s', '   solid-a3', ':cd ~/projects/solid-a3 <BAR>:Telescope find_files<CR>'),
    dashboard.button('w', '   work', ':cd ~/work <CR>'),
    dashboard.button('y', '   explore', ':Telescope file_browser<CR>'),
    dashboard.button('p', '   dots', ':cd ~/.config/nvim <BAR>:Telescope git_files<CR>'),
    dashboard.button('q', '   exit', ':qa<CR>'),
  }
  dashboard.section.buttons.opts = { spacing = 1, width = 10 }

  alpha.setup(dashboard.opts)
end

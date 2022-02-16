-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/rsbear/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rsbear/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rsbear/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rsbear/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rsbear/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.comments\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15dimensions\1\0\2\vheight\4͙��\f̙��\3\nwidth\4͙��\f̙��\3\1\0\2\vborder\vsingle\15auto_close\1\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n\15\0\1\2\0\0\0\2:\1\1\0L\1\2\0�\1\0\0\16\6\2\2\30-\0\0\0+\2\0\0-\3\1\0)\5\1\0004\6\3\0-\a\2\0'\t\0\0B\a\2\2>\a\1\6-\a\0\0+\t\0\0004\n\4\0-\v\2\0005\r\1\0B\v\2\2>\v\1\n-\v\3\0)\r\1\0B\v\2\2>\v\2\n-\v\4\0)\r\2\0-\14\5\0004\15\0\0B\v\4\0?\v\0\0B\a\3\0?\a\1\0B\3\3\0C\0\1\0\2�\5�\3�\4�\6�\v�\1\3\0\0\5\f\t\\item \5\a����\4\5����\4m\0\2\f\0\6\0\0186\2\0\0009\2\1\2\18\4\1\0'\5\2\0B\2\3\0024\3\0\0\18\6\2\0009\4\3\2B\4\2\4X\a\5�6\b\4\0009\b\5\b\18\n\3\0\18\v\a\0B\b\3\1E\a\3\2R\a�L\3\2\0\vinsert\ntable\nlines\6r\npopen\aio�\14\1\0\22\0M\4�\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0009\a\t\a6\b\0\0'\n\n\0B\b\2\0029\b\v\b6\t\0\0'\v\f\0B\t\2\0029\t\r\t9\n\14\0009\n\15\n5\f\16\0B\n\2\0013\n\17\0+\v\0\0003\v\18\0003\f\19\0005\r!\0004\14\a\0\18\15\a\0'\17\21\0'\18\22\0B\15\3\2>\15\1\14\18\15\a\0'\17\23\0'\18\24\0B\15\3\2>\15\2\14\18\15\a\0'\17\25\0'\18\26\0B\15\3\2>\15\3\14\18\15\a\0'\17\27\0'\18\28\0B\15\3\2>\15\4\14\18\15\a\0'\17\29\0'\18\30\0B\15\3\2>\15\5\14\18\15\a\0'\17\31\0'\18 \0B\15\3\0?\15\0\0=\14\"\r4\14\20\0\18\15\a\0'\17\21\0'\18\22\0B\15\3\2>\15\1\14\18\15\a\0'\17\23\0'\18\24\0B\15\3\2>\15\2\14\18\15\a\0'\17\27\0'\18\28\0B\15\3\2>\15\3\14\18\15\a\0'\17\25\0'\18\26\0B\15\3\2>\15\4\14\18\15\a\0'\17\29\0'\18\30\0B\15\3\2>\15\5\14\18\15\a\0'\17\31\0'\18 \0B\15\3\2>\15\6\14\18\15\a\0'\17#\0'\18$\0B\15\3\2>\15\a\14\18\15\a\0'\17%\0'\18&\0B\15\3\2>\15\b\14\18\15\a\0'\17'\0'\18(\0B\15\3\2>\15\t\14\18\15\a\0'\17)\0'\18*\0B\15\3\2>\15\n\14\18\15\a\0'\17+\0'\18,\0B\15\3\2>\15\v\14\18\15\a\0'\17-\0'\18.\0B\15\3\2>\15\f\14\18\15\a\0'\17/\0'\0180\0B\15\3\2>\15\r\14\18\15\a\0'\0171\0'\0182\0B\15\3\2>\15\14\14\18\15\a\0'\0173\0'\0184\0B\15\3\2>\15\15\14\18\15\a\0'\0175\0'\0186\0B\15\3\2>\15\16\14\18\15\a\0'\0177\0'\0188\0B\15\3\2>\15\17\14\18\15\a\0'\0179\0'\18:\0B\15\3\2>\15\18\14\18\15\a\0'\17;\0'\18<\0B\15\3\0?\15\1\0=\14=\r4\14\3\0\18\15\1\0'\17>\0004\18\15\0\18\19\3\0005\21?\0B\19\2\2>\19\1\18\18\19\3\0'\21@\0B\19\2\2>\19\2\18\18\19\4\0)\21\1\0B\19\2\2>\19\3\18\18\19\3\0005\21A\0B\19\2\2>\19\4\18\18\19\3\0'\21B\0B\19\2\2>\19\5\18\18\19\3\0005\21C\0B\19\2\2>\19\6\18\18\19\3\0005\21D\0B\19\2\2>\19\a\18\18\19\3\0005\21E\0B\19\2\2>\19\b\18\18\19\3\0005\21F\0B\19\2\2>\19\t\18\18\19\3\0005\21G\0B\19\2\2>\19\n\18\18\19\3\0005\21H\0B\19\2\2>\19\v\18\18\19\3\0005\21I\0B\19\2\2>\19\f\18\18\19\3\0005\21J\0B\19\2\2>\19\r\18\18\19\3\0005\21K\0B\19\2\0?\19\2\0B\15\3\0?\15\3\0=\14L\r=\r\20\0002\0\0�K\0\1\0\ball\1\2\0\0\20export default \1\3\0\0\6}\6\t\1\2\0\0\6)\1\3\0\0\v</div>\6\t\1\3\0\0\n</h1>\6\t\1\2\0\0\6\t\1\2\0\0\t<h1>\1\3\0\0\n<div>\6\t\1\3\0\0\rreturn (\6\t\6\t\1\3\0\0\24 :FC<any> = () => {\6\t\vconst \1\3\0\0\31import { FC } from 'react'\6\t\brfc\20typescriptreactB<button className=\"$1\" onClick={$2} type=\"button\">$0</button>\vbutton<<input className=\"$1\" placeholder=\"$2\" onChange={$0} />\ninput\20<span>$0</span>\tspan\14<p>$0</p>\6p\16<h6>$0</h6>\ah6\16<h5>$0</h5>\ah5\16<h4>$0</h4>\ah4\16<h3>$0</h3>\ah3\16<h2>$0</h2>\ah2\31<h1 className=\"$1\">$0</h1>\bh1c\16<h1>$0</h1>\ah1!<div className=\"$1\">$0</div>\tdivc\18<div>$0</div>\bdiv\15typescript\1\0\0\"useEffect(() => {\n  $0\n}, [])\beff#const [$1, $2] = useState($0);\nstate console.log('$1 --', $1);$0\bclg\24interface $1 {\n$0\n}\bint\28function $1($2) {\n $0\n}\bfun\27import {$0} from \"$1\";\bimp\rsnippets\0\0\0\1\0\2\fhistory\1\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\bfmt\23luasnip.extras.fmt\brep\19luasnip.extras\18parse_snippet\vparser\17dynamic_node\16choice_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\r����\4'����\4\29����\4\3����\4\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n�\21\0\0\t\0!\1@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\b\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\5\0039\4\b\1'\6\24\0'\a\25\0'\b\26\0B\4\4\2>\4\6\0039\4\b\1'\6\27\0'\a\28\0'\b\29\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\a\0025\3\31\0=\3\30\0029\2 \0009\4\30\1B\2\2\1K\0\1\0\nsetup\1\0\2\nwidth\3\n\fspacing\3\1\topts\f:qa<CR>\15   exit\6q5:cd ~/.config/nvim <BAR>:Telescope git_files<CR>\15   dots\6p :Telescope file_browser<CR>\18   explore\6y\20:cd ~/work <CR>\15   work\6w;:cd ~/projects/solid-a3 <BAR>:Telescope find_files<CR>\19   solid-a3\6s!<cmd>:Telescope oldfiles<CR>\18   recents\6r2:e ~/Documents/vimnotes.md <BAR>:ZenMode <CR>\16   notes\6n\vbutton\fbuttons\1\19\0\0S                                                                              _                                    ██████                                    o                                ████▒▒▒▒▒▒████                                w                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                                                          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            w                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                                                        ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                                                    ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                                                  ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        �\1                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        k                        ██      ██      ████      ████                        S                                                                              S                                                                              \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\15����\4\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["git.nvim"] = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\1\0\2\vbrowse\15<leader>go\nblame\15<leader>gb\nsetup\bgit\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/git.nvim",
    url = "https://github.com/dinhhuy258/git.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\14\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\3B\1\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ahl\20GitGutterChange\ttext\6~\14topdelete\1\0\2\ahl\20GitGutterDelete\ttext\b‾\vdelete\1\0\2\ahl\20GitGutterDelete\ttext\6_\vchange\1\0\2\ahl\20GitGutterChange\ttext\b│\badd\1\0\0\1\0\2\ahl\16GitSignsAdd\ttext\b│\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n�\1\0\1\b\0\14\2\0246\1\0\0009\1\1\0019\1\2\0019\3\3\0'\4\4\0B\1\3\0026\2\5\0009\2\6\2\18\4\1\0B\2\2\2\22\2\0\0025\3\t\0006\4\a\0009\4\b\4\18\6\2\0)\a<\0B\4\3\2=\4\n\0036\4\0\0009\4\v\0049\4\f\4\23\4\1\4=\4\r\3L\3\2\0\vheight\nlines\6o\nwidth\1\0\0\bmax\tmath\blen\vstring\a:~\tpath\16fnamemodify\afn\bvim\b\0�\n\1\0\a\0!\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\16\0005\5\f\0005\6\v\0=\6\r\0053\6\14\0=\6\15\5=\5\17\0045\5\18\0=\5\19\4=\4\20\3=\3\21\0025\3\22\0005\4\23\0005\5\24\0=\5\19\4=\4\20\3=\3\25\0025\3\28\0005\4\26\0005\5\27\0=\5\19\4=\4\20\3=\3\29\2B\0\2\0016\0\30\0009\0\31\0'\2 \0B\0\2\1K\0\1\0(nnoremap \\ :NeoTreeRevealToggle<cr>\bcmd\bvim\15git_status\1\0\0\1\0\17\agu\21git_unstage_file\aga\17git_add_file\6A\16git_add_all\agp\rgit_push\6v\16open_vsplit\6p\25paste_from_clipboard\6c\22copy_to_clipboard\6r\vrename\6d\vdelete\6R\frefresh\6x\21cut_to_clipboard\6C\15close_node\6S\15open_split\18<2-LeftMouse>\topen\agg\24git_commit_and_push\agr\20git_revert_file\t<cr>\topen\1\0\2\rposition\tleft\nwidth\3F\fbuffers\1\0\r\6v\16open_vsplit\6x\21cut_to_clipboard\6a\badd\6S\15open_split\18<2-LeftMouse>\topen\6.\rset_root\6p\25paste_from_clipboard\6c\22copy_to_clipboard\6r\vrename\6d\vdelete\6R\frefresh\t<cr>\topen\6u\16navigate_up\1\0\2\rposition\tleft\nwidth\3F\1\0\1\18show_unloaded\1\15filesystem\vwindow\rmappings\1\0\19\6v\16open_vsplit\18<2-LeftMouse>\topen\6S\15open_split\6R\frefresh\6I\21toggle_gitignore\6.\rset_root\6p\25paste_from_clipboard\6c\22copy_to_clipboard\6r\vrename\6f\21filter_on_submit\6d\vdelete\6H\18toggle_hidden\6u\16navigate_up\6x\21cut_to_clipboard\6C\15close_node\6a\badd\6/\23filter_as_you_type\n<c-x>\17clear_filter\t<cr>\topen\npopup\1\0\0\tsize\0\rposition\1\0\0\1\0\2\brow\0061\bcol\t100%\ffilters\1\0\1\27use_libuv_file_watcher\2\1\0\2\22respect_gitignore\1\16show_hidden\2\30default_component_configs\ticon\1\0\0\1\0\2\16folder_open\b\18folder_closed\b\1\0\3\23popup_border_style\frounded\23enable_diagnostics\2\22enable_git_status\2\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n�\2\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3B\1\2\1K\0\1\0\rmappings\vstatus\1\0\0\1\0\2\14<leader>q\nClose\6B\16BranchPopup\1\0\6\"disable_builtin_notifications\1\17auto_refresh\2 disable_commit_confirmation\2!disable_context_highlighting\1\17disable_hint\1\18disable_signs\1\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\a\0005\5\6\0=\5\b\0045\5\t\0=\5\n\4=\4\v\3B\1\2\1K\0\1\0\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\rmap_char\1\0\2\ball\6(\btex\6{\1\0\5\16auto_select\2\17map_complete\2\vmap_cr\2\rcheck_ts\2\vinsert\1\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\2�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\tjump\rjumpable\21select_prev_item\fvisible�\5\1\0\v\0'\0H6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\f\0009\a\n\0009\a\v\a)\t��B\a\2\2=\a\r\0069\a\n\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\n\0009\a\15\aB\a\1\2=\a\16\0069\a\n\0009\a\17\aB\a\1\2=\a\18\0069\a\n\0009\a\19\a5\t\20\0B\a\2\2=\a\21\0069\a\n\0003\t\22\0005\n\23\0B\a\3\2=\a\24\0069\a\n\0003\t\25\0B\a\2\2=\a\26\6=\6\n\0059\6\27\0009\6\28\0064\b\3\0005\t\29\0>\t\1\b5\t\30\0>\t\2\b4\t\3\0005\n\31\0>\n\1\tB\6\3\2=\6\28\0055\6$\0009\a \0015\t!\0005\n\"\0=\n#\tB\a\2\2=\a%\6=\6&\5B\3\2\0012\0\0�K\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\rnvim_lua\n[api]\rnvim_lsp\n[LSP]\vbuffer\n[buf]\fluasnip\v[snip]\tpath\v[path]\1\0\1\14with_text\1\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\1\0\1\6\2\n\0\25-\1\0\0008\1\0\1\14\0\1\0X\2\1�4\1\0\0006\2\0\0009\2\1\0029\2\2\0029\2\3\2B\2\1\0026\3\4\0009\3\5\0039\3\6\3\15\0\3\0X\4\a�6\3\a\0'\5\6\0B\3\2\0029\3\b\3\18\5\2\0B\3\2\2\18\2\3\0-\3\1\0=\3\t\1L\1\2\0\3�\1�\14on_attach\24update_capabilities\frequire\17cmp_nvim_lsp\vloaded\fpackage\29make_client_capabilities\rprotocol\blsp\bvim0\0\1\a\1\2\0\a\18\3\0\0009\1\0\0-\4\0\0009\6\1\0B\4\2\0A\1\1\1K\0\1\0\4�\tname\nsetup�\5\1\0\t\0-\0I6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\0015\3\19\0005\4\b\0006\5\6\0009\5\a\5\18\a\2\0B\5\2\2=\5\t\0045\5\n\0=\5\v\0049\5\f\0009\5\r\0055\a\14\0B\5\2\2=\5\15\0045\5\16\0=\2\17\5=\5\18\4=\4\20\0035\4\28\0005\5\26\0005\6\24\0005\a\22\0005\b\21\0=\b\23\a=\a\25\6=\6\27\5=\5\18\4=\4\29\0035\4\31\0005\5\30\0=\5\t\4=\4 \0035\4#\0005\5\"\0009\6\f\0009\6\r\6'\b!\0B\6\2\2=\6\15\5=\5\18\4=\4$\0035\4'\0005\5&\0009\6\f\0009\6\r\0065\b%\0B\6\2\2=\6\15\5=\5\18\4=\4(\0033\4)\0006\5\0\0'\a*\0B\5\2\0029\5+\0053\a,\0B\5\2\0012\0\0�K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\0\vdenols\1\0\0\1\0\0\1\4\0\0\14deno.json\19importmap.json\vmod.ts\rtsserver\1\0\0\1\0\0\17package.json\17svelteserver\1\0\0\1\3\0\0\thtml\vsvelte\16sumneko_lua\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\befm\1\0\0\rsettings\14languages\1\0\0\rroot_dir\1\3\0\0\n.git/\6.\17root_pattern\tutil\17init_options\1\0\1\23documentFormatting\2\14filetypes\1\0\0\rtbl_keys\bvim\nsetup\19plugins.lsp.ui\23plugins.lsp.format\26plugins.lsp.on_attach\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\14\0005\5\r\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\26context_commentstring\vconfig\15javascript\1\0\0\1\0\5\14__default\n// %s\fcomment\n// %s\18jsx_attribute\n// %s\17jsx_fragment\15{/* %s */}\16jsx_element\15{/* %s */}\1\0\2\19enable_autocmd\1\venable\2\fautotag\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\21ensure_installed\15maintained\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pounce.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vpounce\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["searchbox.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/searchbox.nvim",
    url = "https://github.com/VonHeikemen/searchbox.nvim"
  },
  ["substrata.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/substrata.nvim",
    url = "https://github.com/kvrohit/substrata.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\t\0#\0*6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\23\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\6\b\0055\6\n\0005\a\t\0=\a\v\6=\6\f\0055\6\r\0=\6\14\0055\6\18\0005\a\15\0009\b\16\1=\b\17\a=\a\19\0065\a\20\0009\b\16\1=\b\17\a=\a\21\6=\6\22\5=\5\24\0045\5\26\0005\6\25\0=\6\27\0055\6\28\0=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\5=\5\"\4B\2\2\1K\0\1\0\fpickers\15find_files\1\0\2\14previewer\1\ntheme\rdropdown\fbuffers\1\0\1\ntheme\rdropdown\14live_grep\1\0\1\ntheme\bivy\15git_status\1\0\0\1\0\2\17shorten_path\2\ntheme\bivy\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-t>\22open_with_trouble\1\0\2\n<C-d>\1\n<C-u>\1\25file_ignore_patterns\1\5\0\0\17node_modules\14yarn.lock\19yarn-error.log\19pnpm-lock.yaml\18layout_config\15horizontal\1\0\0\1\0\1\nwidth\4͙��\f̙��\3\22vimgrep_arguments\1\a\0\0\arg\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\17path_display\1\0\0\1\0\1\fshorten\3\5\nsetup trouble.providers.telescope\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\b\fwarning\b\thint\b\nerror\b\nother\b﫠\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\rprevious\6k\tnext\6j\fpreview\6p\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\vcancel\n<esc>\nclose\6q\frefresh\6r\1\0\r\14auto_open\1\17indent_lines\2\16fold_closed\b\15auto_close\1\14fold_open\b\tmode\26workspace_diagnostics\nicons\1\17auto_preview\2\rposition\nright\14auto_fold\1\29use_lsp_diagnostic_signs\1\vheight\3\n\nwidth\0032\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\1\0\1\rbackdrop\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\1\0\1\6\2\n\0\25-\1\0\0008\1\0\1\14\0\1\0X\2\1�4\1\0\0006\2\0\0009\2\1\0029\2\2\0029\2\3\2B\2\1\0026\3\4\0009\3\5\0039\3\6\3\15\0\3\0X\4\a�6\3\a\0'\5\6\0B\3\2\0029\3\b\3\18\5\2\0B\3\2\2\18\2\3\0-\3\1\0=\3\t\1L\1\2\0\3�\1�\14on_attach\24update_capabilities\frequire\17cmp_nvim_lsp\vloaded\fpackage\29make_client_capabilities\rprotocol\blsp\bvim0\0\1\a\1\2\0\a\18\3\0\0009\1\0\0-\4\0\0009\6\1\0B\4\2\0A\1\1\1K\0\1\0\4�\tname\nsetup�\5\1\0\t\0-\0I6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\0015\3\19\0005\4\b\0006\5\6\0009\5\a\5\18\a\2\0B\5\2\2=\5\t\0045\5\n\0=\5\v\0049\5\f\0009\5\r\0055\a\14\0B\5\2\2=\5\15\0045\5\16\0=\2\17\5=\5\18\4=\4\20\0035\4\28\0005\5\26\0005\6\24\0005\a\22\0005\b\21\0=\b\23\a=\a\25\6=\6\27\5=\5\18\4=\4\29\0035\4\31\0005\5\30\0=\5\t\4=\4 \0035\4#\0005\5\"\0009\6\f\0009\6\r\6'\b!\0B\6\2\2=\6\15\5=\5\18\4=\4$\0035\4'\0005\5&\0009\6\f\0009\6\r\0065\b%\0B\6\2\2=\6\15\5=\5\18\4=\4(\0033\4)\0006\5\0\0'\a*\0B\5\2\0029\5+\0053\a,\0B\5\2\0012\0\0�K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\0\vdenols\1\0\0\1\0\0\1\4\0\0\14deno.json\19importmap.json\vmod.ts\rtsserver\1\0\0\1\0\0\17package.json\17svelteserver\1\0\0\1\3\0\0\thtml\vsvelte\16sumneko_lua\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\befm\1\0\0\rsettings\14languages\1\0\0\rroot_dir\1\3\0\0\n.git/\6.\17root_pattern\tutil\17init_options\1\0\1\23documentFormatting\2\14filetypes\1\0\0\rtbl_keys\bvim\nsetup\19plugins.lsp.ui\23plugins.lsp.format\26plugins.lsp.on_attach\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n�\21\0\0\t\0!\1@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\b\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\5\0039\4\b\1'\6\24\0'\a\25\0'\b\26\0B\4\4\2>\4\6\0039\4\b\1'\6\27\0'\a\28\0'\b\29\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\a\0025\3\31\0=\3\30\0029\2 \0009\4\30\1B\2\2\1K\0\1\0\nsetup\1\0\2\nwidth\3\n\fspacing\3\1\topts\f:qa<CR>\15   exit\6q5:cd ~/.config/nvim <BAR>:Telescope git_files<CR>\15   dots\6p :Telescope file_browser<CR>\18   explore\6y\20:cd ~/work <CR>\15   work\6w;:cd ~/projects/solid-a3 <BAR>:Telescope find_files<CR>\19   solid-a3\6s!<cmd>:Telescope oldfiles<CR>\18   recents\6r2:e ~/Documents/vimnotes.md <BAR>:ZenMode <CR>\16   notes\6n\vbutton\fbuttons\1\19\0\0S                                                                              _                                    ██████                                    o                                ████▒▒▒▒▒▒████                                w                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                                                          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            w                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                                                        ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                                                    ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                                                  ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        �\1                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        k                        ██      ██      ████      ████                        S                                                                              S                                                                              \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\15����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\14\0005\5\r\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\26context_commentstring\vconfig\15javascript\1\0\0\1\0\5\14__default\n// %s\fcomment\n// %s\18jsx_attribute\n// %s\17jsx_fragment\15{/* %s */}\16jsx_element\15{/* %s */}\1\0\2\19enable_autocmd\1\venable\2\fautotag\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\21ensure_installed\15maintained\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\t\0#\0*6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\23\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\6\b\0055\6\n\0005\a\t\0=\a\v\6=\6\f\0055\6\r\0=\6\14\0055\6\18\0005\a\15\0009\b\16\1=\b\17\a=\a\19\0065\a\20\0009\b\16\1=\b\17\a=\a\21\6=\6\22\5=\5\24\0045\5\26\0005\6\25\0=\6\27\0055\6\28\0=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\5=\5\"\4B\2\2\1K\0\1\0\fpickers\15find_files\1\0\2\14previewer\1\ntheme\rdropdown\fbuffers\1\0\1\ntheme\rdropdown\14live_grep\1\0\1\ntheme\bivy\15git_status\1\0\0\1\0\2\17shorten_path\2\ntheme\bivy\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-t>\22open_with_trouble\1\0\2\n<C-d>\1\n<C-u>\1\25file_ignore_patterns\1\5\0\0\17node_modules\14yarn.lock\19yarn-error.log\19pnpm-lock.yaml\18layout_config\15horizontal\1\0\0\1\0\1\nwidth\4͙��\f̙��\3\22vimgrep_arguments\1\a\0\0\arg\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\17path_display\1\0\0\1\0\1\fshorten\3\5\nsetup trouble.providers.telescope\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\a\0005\5\6\0=\5\b\0045\5\t\0=\5\n\4=\4\v\3B\1\2\1K\0\1\0\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\rmap_char\1\0\2\ball\6(\btex\6{\1\0\5\16auto_select\2\17map_complete\2\vmap_cr\2\rcheck_ts\2\vinsert\1\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\1\b\0\14\2\0246\1\0\0009\1\1\0019\1\2\0019\3\3\0'\4\4\0B\1\3\0026\2\5\0009\2\6\2\18\4\1\0B\2\2\2\22\2\0\0025\3\t\0006\4\a\0009\4\b\4\18\6\2\0)\a<\0B\4\3\2=\4\n\0036\4\0\0009\4\v\0049\4\f\4\23\4\1\4=\4\r\3L\3\2\0\vheight\nlines\6o\nwidth\1\0\0\bmax\tmath\blen\vstring\a:~\tpath\16fnamemodify\afn\bvim\b\0�\n\1\0\a\0!\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\16\0005\5\f\0005\6\v\0=\6\r\0053\6\14\0=\6\15\5=\5\17\0045\5\18\0=\5\19\4=\4\20\3=\3\21\0025\3\22\0005\4\23\0005\5\24\0=\5\19\4=\4\20\3=\3\25\0025\3\28\0005\4\26\0005\5\27\0=\5\19\4=\4\20\3=\3\29\2B\0\2\0016\0\30\0009\0\31\0'\2 \0B\0\2\1K\0\1\0(nnoremap \\ :NeoTreeRevealToggle<cr>\bcmd\bvim\15git_status\1\0\0\1\0\17\agu\21git_unstage_file\aga\17git_add_file\6A\16git_add_all\agp\rgit_push\6v\16open_vsplit\6p\25paste_from_clipboard\6c\22copy_to_clipboard\6r\vrename\6d\vdelete\6R\frefresh\6x\21cut_to_clipboard\6C\15close_node\6S\15open_split\18<2-LeftMouse>\topen\agg\24git_commit_and_push\agr\20git_revert_file\t<cr>\topen\1\0\2\rposition\tleft\nwidth\3F\fbuffers\1\0\r\6v\16open_vsplit\6x\21cut_to_clipboard\6a\badd\6S\15open_split\18<2-LeftMouse>\topen\6.\rset_root\6p\25paste_from_clipboard\6c\22copy_to_clipboard\6r\vrename\6d\vdelete\6R\frefresh\t<cr>\topen\6u\16navigate_up\1\0\2\rposition\tleft\nwidth\3F\1\0\1\18show_unloaded\1\15filesystem\vwindow\rmappings\1\0\19\6v\16open_vsplit\18<2-LeftMouse>\topen\6S\15open_split\6R\frefresh\6I\21toggle_gitignore\6.\rset_root\6p\25paste_from_clipboard\6c\22copy_to_clipboard\6r\vrename\6f\21filter_on_submit\6d\vdelete\6H\18toggle_hidden\6u\16navigate_up\6x\21cut_to_clipboard\6C\15close_node\6a\badd\6/\23filter_as_you_type\n<c-x>\17clear_filter\t<cr>\topen\npopup\1\0\0\tsize\0\rposition\1\0\0\1\0\2\brow\0061\bcol\t100%\ffilters\1\0\1\27use_libuv_file_watcher\2\1\0\2\22respect_gitignore\1\16show_hidden\2\30default_component_configs\ticon\1\0\0\1\0\2\16folder_open\b\18folder_closed\b\1\0\3\23popup_border_style\frounded\23enable_diagnostics\2\22enable_git_status\2\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\b\fwarning\b\thint\b\nerror\b\nother\b﫠\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\rprevious\6k\tnext\6j\fpreview\6p\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\vcancel\n<esc>\nclose\6q\frefresh\6r\1\0\r\14auto_open\1\17indent_lines\2\16fold_closed\b\15auto_close\1\14fold_open\b\tmode\26workspace_diagnostics\nicons\1\17auto_preview\2\rposition\nright\14auto_fold\1\29use_lsp_diagnostic_signs\1\vheight\3\n\nwidth\0032\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n\15\0\1\2\0\0\0\2:\1\1\0L\1\2\0�\1\0\0\16\6\2\2\30-\0\0\0+\2\0\0-\3\1\0)\5\1\0004\6\3\0-\a\2\0'\t\0\0B\a\2\2>\a\1\6-\a\0\0+\t\0\0004\n\4\0-\v\2\0005\r\1\0B\v\2\2>\v\1\n-\v\3\0)\r\1\0B\v\2\2>\v\2\n-\v\4\0)\r\2\0-\14\5\0004\15\0\0B\v\4\0?\v\0\0B\a\3\0?\a\1\0B\3\3\0C\0\1\0\2�\5�\3�\4�\6�\v�\1\3\0\0\5\f\t\\item \5\a����\4\5����\4m\0\2\f\0\6\0\0186\2\0\0009\2\1\2\18\4\1\0'\5\2\0B\2\3\0024\3\0\0\18\6\2\0009\4\3\2B\4\2\4X\a\5�6\b\4\0009\b\5\b\18\n\3\0\18\v\a\0B\b\3\1E\a\3\2R\a�L\3\2\0\vinsert\ntable\nlines\6r\npopen\aio�\14\1\0\22\0M\4�\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0009\a\t\a6\b\0\0'\n\n\0B\b\2\0029\b\v\b6\t\0\0'\v\f\0B\t\2\0029\t\r\t9\n\14\0009\n\15\n5\f\16\0B\n\2\0013\n\17\0+\v\0\0003\v\18\0003\f\19\0005\r!\0004\14\a\0\18\15\a\0'\17\21\0'\18\22\0B\15\3\2>\15\1\14\18\15\a\0'\17\23\0'\18\24\0B\15\3\2>\15\2\14\18\15\a\0'\17\25\0'\18\26\0B\15\3\2>\15\3\14\18\15\a\0'\17\27\0'\18\28\0B\15\3\2>\15\4\14\18\15\a\0'\17\29\0'\18\30\0B\15\3\2>\15\5\14\18\15\a\0'\17\31\0'\18 \0B\15\3\0?\15\0\0=\14\"\r4\14\20\0\18\15\a\0'\17\21\0'\18\22\0B\15\3\2>\15\1\14\18\15\a\0'\17\23\0'\18\24\0B\15\3\2>\15\2\14\18\15\a\0'\17\27\0'\18\28\0B\15\3\2>\15\3\14\18\15\a\0'\17\25\0'\18\26\0B\15\3\2>\15\4\14\18\15\a\0'\17\29\0'\18\30\0B\15\3\2>\15\5\14\18\15\a\0'\17\31\0'\18 \0B\15\3\2>\15\6\14\18\15\a\0'\17#\0'\18$\0B\15\3\2>\15\a\14\18\15\a\0'\17%\0'\18&\0B\15\3\2>\15\b\14\18\15\a\0'\17'\0'\18(\0B\15\3\2>\15\t\14\18\15\a\0'\17)\0'\18*\0B\15\3\2>\15\n\14\18\15\a\0'\17+\0'\18,\0B\15\3\2>\15\v\14\18\15\a\0'\17-\0'\18.\0B\15\3\2>\15\f\14\18\15\a\0'\17/\0'\0180\0B\15\3\2>\15\r\14\18\15\a\0'\0171\0'\0182\0B\15\3\2>\15\14\14\18\15\a\0'\0173\0'\0184\0B\15\3\2>\15\15\14\18\15\a\0'\0175\0'\0186\0B\15\3\2>\15\16\14\18\15\a\0'\0177\0'\0188\0B\15\3\2>\15\17\14\18\15\a\0'\0179\0'\18:\0B\15\3\2>\15\18\14\18\15\a\0'\17;\0'\18<\0B\15\3\0?\15\1\0=\14=\r4\14\3\0\18\15\1\0'\17>\0004\18\15\0\18\19\3\0005\21?\0B\19\2\2>\19\1\18\18\19\3\0'\21@\0B\19\2\2>\19\2\18\18\19\4\0)\21\1\0B\19\2\2>\19\3\18\18\19\3\0005\21A\0B\19\2\2>\19\4\18\18\19\3\0'\21B\0B\19\2\2>\19\5\18\18\19\3\0005\21C\0B\19\2\2>\19\6\18\18\19\3\0005\21D\0B\19\2\2>\19\a\18\18\19\3\0005\21E\0B\19\2\2>\19\b\18\18\19\3\0005\21F\0B\19\2\2>\19\t\18\18\19\3\0005\21G\0B\19\2\2>\19\n\18\18\19\3\0005\21H\0B\19\2\2>\19\v\18\18\19\3\0005\21I\0B\19\2\2>\19\f\18\18\19\3\0005\21J\0B\19\2\2>\19\r\18\18\19\3\0005\21K\0B\19\2\0?\19\2\0B\15\3\0?\15\3\0=\14L\r=\r\20\0002\0\0�K\0\1\0\ball\1\2\0\0\20export default \1\3\0\0\6}\6\t\1\2\0\0\6)\1\3\0\0\v</div>\6\t\1\3\0\0\n</h1>\6\t\1\2\0\0\6\t\1\2\0\0\t<h1>\1\3\0\0\n<div>\6\t\1\3\0\0\rreturn (\6\t\6\t\1\3\0\0\24 :FC<any> = () => {\6\t\vconst \1\3\0\0\31import { FC } from 'react'\6\t\brfc\20typescriptreactB<button className=\"$1\" onClick={$2} type=\"button\">$0</button>\vbutton<<input className=\"$1\" placeholder=\"$2\" onChange={$0} />\ninput\20<span>$0</span>\tspan\14<p>$0</p>\6p\16<h6>$0</h6>\ah6\16<h5>$0</h5>\ah5\16<h4>$0</h4>\ah4\16<h3>$0</h3>\ah3\16<h2>$0</h2>\ah2\31<h1 className=\"$1\">$0</h1>\bh1c\16<h1>$0</h1>\ah1!<div className=\"$1\">$0</div>\tdivc\18<div>$0</div>\bdiv\15typescript\1\0\0\"useEffect(() => {\n  $0\n}, [])\beff#const [$1, $2] = useState($0);\nstate console.log('$1 --', $1);$0\bclg\24interface $1 {\n$0\n}\bint\28function $1($2) {\n $0\n}\bfun\27import {$0} from \"$1\";\bimp\rsnippets\0\0\0\1\0\2\fhistory\1\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\bfmt\23luasnip.extras.fmt\brep\19luasnip.extras\18parse_snippet\vparser\17dynamic_node\16choice_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\r����\4'����\4\29����\4\3����\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3B\1\2\1K\0\1\0\rmappings\vstatus\1\0\0\1\0\2\14<leader>q\nClose\6B\16BranchPopup\1\0\6\"disable_builtin_notifications\1\17auto_refresh\2 disable_commit_confirmation\2!disable_context_highlighting\1\17disable_hint\1\18disable_signs\1\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15dimensions\1\0\2\vheight\4͙��\f̙��\3\nwidth\4͙��\f̙��\3\1\0\2\vborder\vsingle\15auto_close\1\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\2�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\tjump\rjumpable\21select_prev_item\fvisible�\5\1\0\v\0'\0H6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\f\0009\a\n\0009\a\v\a)\t��B\a\2\2=\a\r\0069\a\n\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\n\0009\a\15\aB\a\1\2=\a\16\0069\a\n\0009\a\17\aB\a\1\2=\a\18\0069\a\n\0009\a\19\a5\t\20\0B\a\2\2=\a\21\0069\a\n\0003\t\22\0005\n\23\0B\a\3\2=\a\24\0069\a\n\0003\t\25\0B\a\2\2=\a\26\6=\6\n\0059\6\27\0009\6\28\0064\b\3\0005\t\29\0>\t\1\b5\t\30\0>\t\2\b4\t\3\0005\n\31\0>\n\1\tB\6\3\2=\6\28\0055\6$\0009\a \0015\t!\0005\n\"\0=\n#\tB\a\2\2=\a%\6=\6&\5B\3\2\0012\0\0�K\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\rnvim_lua\n[api]\rnvim_lsp\n[LSP]\vbuffer\n[buf]\fluasnip\v[snip]\tpath\v[path]\1\0\1\14with_text\1\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.comments\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: git.nvim
time([[Config for git.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\1\0\2\vbrowse\15<leader>go\nblame\15<leader>gb\nsetup\bgit\frequire\0", "config", "git.nvim")
time([[Config for git.nvim]], false)
-- Config for: pounce.nvim
time([[Config for pounce.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vpounce\frequire\0", "config", "pounce.nvim")
time([[Config for pounce.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\14\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\15\3B\1\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ahl\20GitGutterChange\ttext\6~\14topdelete\1\0\2\ahl\20GitGutterDelete\ttext\b‾\vdelete\1\0\2\ahl\20GitGutterDelete\ttext\6_\vchange\1\0\2\ahl\20GitGutterChange\ttext\b│\badd\1\0\0\1\0\2\ahl\16GitSignsAdd\ttext\b│\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\1\0\1\rbackdrop\3\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

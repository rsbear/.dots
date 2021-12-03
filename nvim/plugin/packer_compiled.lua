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
  LuaSnip = {
    config = { "\27LJ\2\n\15\0\1\2\0\0\0\2:\1\1\0L\1\2\0�\1\0\0\16\6\2\2\30-\0\0\0+\2\0\0-\3\1\0)\5\1\0004\6\3\0-\a\2\0'\t\0\0B\a\2\2>\a\1\6-\a\0\0+\t\0\0004\n\4\0-\v\2\0005\r\1\0B\v\2\2>\v\1\n-\v\3\0)\r\1\0B\v\2\2>\v\2\n-\v\4\0)\r\2\0-\14\5\0004\15\0\0B\v\4\0?\v\0\0B\a\3\0?\a\1\0B\3\3\0C\0\1\0\2�\6�\3�\4�\a�\15�\1\3\0\0\5\f\t\\item \5\a����\4\5����\4�\b\0\2\21\3\31\3�\0014\2\4\0-\3\0\0005\5\0\0B\3\2\2>\3\1\2-\3\1\0)\5\1\0'\6\1\0B\3\3\2>\3\2\2-\3\0\0005\5\2\0B\3\2\0?\3\0\0004\3\0\0\15\0\1\0X\4\b�-\4\1\0)\6\1\0009\a\3\1\18\t\a\0009\a\4\aB\a\2\0A\4\1\2>\4\2\2:\4\2\2=\4\3\0036\4\5\0009\4\6\4:\6\2\0:\6\1\6'\a\a\0B\4\3\2\15\0\4\0X\5\t�6\4\b\0009\4\t\4\18\6\2\0004\a\3\0-\b\0\0005\n\n\0B\b\2\0?\b\1\0B\4\3\1)\4\2\0006\5\v\0006\a\b\0009\a\f\a:\t\2\0:\t\1\t'\n\a\0+\v\2\0B\a\4\0A\5\0\4X\b7�6\n\b\0009\n\f\n\18\f\t\0'\r\r\0+\14\2\0B\n\4\2:\t\2\n\15\0\t\0X\n.�+\n\0\0\15\0\1\0X\v\15�8\v\t\1\15\0\v\0X\f\f�-\v\1\0\18\r\4\0'\14\14\0\18\15\t\0&\14\15\0148\14\14\1\18\16\14\0009\14\4\14B\14\2\0A\v\1\2\18\n\v\0X\v\4�-\v\1\0\18\r\4\0B\v\2\2\18\n\v\0006\v\b\0009\v\t\v\18\r\2\0004\14\4\0-\15\0\0004\17\3\0'\18\15\0\18\19\t\0'\20\r\0&\18\20\18>\18\1\17B\15\2\2>\15\1\14>\n\2\14-\15\0\0005\17\16\0B\15\2\0?\15\0\0B\v\3\1'\v\14\0\18\f\t\0&\v\f\v<\n\v\3\22\4\2\4E\b\3\3R\b�:\5\1\0:\5\1\5\6\5\17\0X\5#�+\5\0\0\15\0\1\0X\6\f�9\6\18\1\15\0\6\0X\a\t�-\6\1\0\18\b\4\0009\t\18\1\18\v\t\0009\t\4\tB\t\2\0A\6\1\2\18\5\6\0X\6\4�-\6\1\0\18\b\4\0B\6\2\2\18\5\6\0006\6\b\0009\6\t\6\18\b\2\0004\t\4\0-\n\0\0005\f\19\0B\n\2\2>\n\1\t>\5\2\t-\n\0\0005\f\20\0B\n\2\0?\n\0\0B\6\3\1=\5\18\3\22\4\2\0046\5\b\0009\5\21\5:\a\3\0B\5\2\2\b\5\2\0X\5/�6\5\5\0009\5\22\5:\a\3\0:\a\2\a'\b\23\0'\t\24\0B\5\4\2+\6\0\0\15\0\1\0X\a\f�9\a\25\1\15\0\a\0X\b\t�-\a\1\0\18\t\4\0009\n\25\1\18\f\n\0009\n\4\nB\n\2\0A\a\1\2\18\6\a\0X\a\4�-\a\1\0\18\t\4\0B\a\2\2\18\6\a\0006\a\b\0009\a\t\a\18\t\2\0004\n\4\0-\v\0\0005\r\26\0'\14\27\0\18\15\5\0'\16\r\0&\14\16\14>\14\2\rB\v\2\2>\v\1\n>\6\2\n-\v\0\0005\r\28\0B\v\2\0?\v\0\0B\a\3\1=\6\25\3\22\4\2\0046\5\b\0009\5\t\5\18\a\2\0004\b\3\0-\t\0\0005\v\29\0B\t\2\0?\t\1\0B\5\3\1-\5\2\0+\a\0\0\18\b\2\0B\5\3\2=\3\30\5L\5\2\0\3�\4�\2�\14old_state\1\2\0\0\b */\1\3\0\0\5\5\16 * @throws \1\2\0\0\b * \aex\5\r throws \tgsub\14tbl_count\1\3\0\0\5\5\1\3\0\0\b * \16 * @return \bret\tvoid\1\3\0\0\5\5\15 * @param \barg\6 \nsplit\vipairs\1\3\0\0\b * \5\16list_extend\bvim\a, \tfind\vstring\rget_text\ndescr\1\3\0\0\5\5\24A short Description\1\3\0\0\b/**\b * \a����\4\3����\4\2m\0\2\f\0\6\0\0186\2\0\0009\2\1\2\18\4\1\0'\5\2\0B\2\3\0024\3\0\0\18\6\2\0009\4\3\2B\4\2\4X\a\5�6\b\4\0009\b\5\b\18\n\3\0\18\v\a\0B\b\3\1E\a\3\2R\a�L\3\2\0\vinsert\ntable\nlines\6r\npopen\aio�\20\1\0\28\0\\\6�\0036\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0006\b\0\0'\n\t\0B\b\2\0029\b\n\b6\t\0\0'\v\t\0B\t\2\0029\t\v\t6\n\0\0'\f\t\0B\n\2\0029\n\f\n6\v\0\0'\r\t\0B\v\2\0029\v\r\v6\f\0\0'\14\t\0B\f\2\0029\f\14\f6\r\0\0'\15\t\0B\r\2\0029\r\15\r9\14\16\0009\14\17\0145\16\18\0B\14\2\0013\14\19\0+\15\0\0003\15\20\0003\16\21\0003\17\22\0005\18Z\0004\19\17\0\18\20\1\0'\22\24\0004\23\b\0\18\24\3\0005\26\25\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26\26\0B\24\2\2>\24\3\23\18\24\4\0)\26\2\0'\27\27\0B\24\3\2>\24\4\23\18\24\3\0005\26\28\0B\24\2\2>\24\5\23\18\24\4\0)\26\0\0B\24\2\2>\24\6\23\18\24\3\0005\26\29\0B\24\2\0?\24\0\0B\20\3\2>\20\1\19\18\20\1\0'\22\30\0004\23\a\0\18\24\3\0005\26\31\0B\24\2\2>\24\1\23\18\24\3\0'\26 \0B\24\2\2>\24\2\23\18\24\4\0)\26\1\0B\24\2\2>\24\3\23\18\24\3\0'\26!\0B\24\2\2>\24\4\23\18\24\4\0)\26\2\0B\24\2\2>\24\5\23\18\24\3\0'\26\"\0B\24\2\0?\24\1\0B\20\3\2>\20\2\19\18\20\1\0'\22#\0004\23\15\0\18\24\3\0005\26$\0B\24\2\2>\24\1\23\18\24\3\0'\26%\0B\24\2\2>\24\2\23\18\24\4\0)\26\1\0B\24\2\2>\24\3\23\18\24\3\0005\26&\0B\24\2\2>\24\4\23\18\24\3\0'\26'\0B\24\2\2>\24\5\23\18\24\3\0005\26(\0B\24\2\2>\24\6\23\18\24\3\0005\26)\0B\24\2\2>\24\a\23\18\24\3\0005\26*\0B\24\2\2>\24\b\23\18\24\3\0005\26+\0B\24\2\2>\24\t\23\18\24\3\0005\26,\0B\24\2\2>\24\n\23\18\24\3\0005\26-\0B\24\2\2>\24\v\23\18\24\3\0005\26.\0B\24\2\2>\24\f\23\18\24\3\0005\26/\0B\24\2\2>\24\r\23\18\24\3\0005\0260\0B\24\2\0?\24\2\0B\20\3\2>\20\3\19\18\20\1\0'\0221\0004\23\5\0\18\24\3\0005\0262\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\0263\0B\24\2\0?\24\3\0B\20\3\2>\20\4\19\18\20\1\0'\0224\0004\23\5\0\18\24\3\0005\0265\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\0266\0B\24\2\0?\24\3\0B\20\3\2>\20\5\19\18\20\1\0'\0227\0004\23\5\0\18\24\3\0005\0268\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\0269\0B\24\2\0?\24\3\0B\20\3\2>\20\6\19\18\20\1\0'\22:\0004\23\5\0\18\24\3\0005\26;\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26<\0B\24\2\0?\24\3\0B\20\3\2>\20\a\19\18\20\1\0'\22=\0004\23\5\0\18\24\3\0005\26>\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26?\0B\24\2\0?\24\3\0B\20\3\2>\20\b\19\18\20\1\0'\22@\0004\23\5\0\18\24\3\0005\26A\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26B\0B\24\2\0?\24\3\0B\20\3\2>\20\t\19\18\20\1\0'\22C\0004\23\5\0\18\24\3\0005\26D\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26E\0B\24\2\0?\24\3\0B\20\3\2>\20\n\19\18\20\1\0'\22F\0004\23\5\0\18\24\3\0005\26G\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26H\0B\24\2\0?\24\3\0B\20\3\2>\20\v\19\18\20\1\0'\22I\0004\23\5\0\18\24\3\0005\26J\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26K\0B\24\2\0?\24\3\0B\20\3\2>\20\f\19\18\20\1\0'\22L\0004\23\5\0\18\24\3\0005\26M\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26N\0B\24\2\0?\24\3\0B\20\3\2>\20\r\19\18\20\1\0'\22O\0004\23\5\0\18\24\3\0005\26P\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26Q\0B\24\2\0?\24\3\0B\20\3\2>\20\14\19\18\20\1\0'\22R\0004\23\5\0\18\24\3\0005\26S\0B\24\2\2>\24\1\23\18\24\3\0005\26T\0B\24\2\2>\24\2\23\18\24\4\0)\26\1\0B\24\2\2>\24\3\23\18\24\3\0005\26U\0B\24\2\0?\24\3\0B\20\3\2>\20\15\19\18\20\1\0'\22V\0004\23\6\0\18\24\3\0005\26W\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0005\26X\0B\24\2\2>\24\3\23\18\24\4\0)\26\0\0B\24\2\2>\24\4\23\18\24\3\0005\26Y\0B\24\2\0?\24\4\0B\20\3\0?\20\5\0=\19[\18=\18\23\0002\0\0�K\0\1\0\ball\1\0\0\1\2\0\0\6>\1\2\0\0\b></\1\2\0\0\6<\atg\1\2\0\0\t' />\1\2\0\0\18placeholder='\1\2\0\0\24<input onChange={} \ninput\n</h6>\1\2\0\0\n<h6 >\ah6\n</h5>\1\2\0\0\n<h5 >\ah5\n</h4>\1\2\0\0\n<h4 >\ah4\n</h3>\1\2\0\0\n<h3 >\ah3\n</h2>\1\2\0\0\n<h2 >\ah2\n</h1>\1\2\0\0\n<h1 >\ah1\t</a>\1\2\0\0\t<a >\6a\14</button>\1\2\0\0'<button type='button' onClick={} >\vbutton\f</span>\1\2\0\0\f<span >\tspan\t</p>\1\2\0\0\t<p >\6p\v</div>\1\2\0\0\v<div >\bdiv\1\2\0\0\20export default \1\3\0\0\6}\6\t\1\2\0\0\6)\1\3\0\0\v</div>\6\t\1\3\0\0\n</h1>\6\t\1\2\0\0\6\t\1\2\0\0\t<h1>\1\3\0\0\n<div>\6\t\1\3\0\0\rreturn (\6\t\6\t\1\3\0\0\24 :FC<any> = () => {\6\t\vconst \1\3\0\0\31import { FC } from 'react'\6\t\brfc\6)\f  ---',\6'\1\2\0\0\17console.log(\bclg\1\3\0\0\5\6}\1\3\0\0\b) {\6\t\barg\6(\1\3\0\0\5\14function \afn\rsnippets\0\0\0\0\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\19dynamic_lambda\rnonempty\nmatch\fpartial\brep\vlambda\19luasnip.extras\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\15����\4\r����\4\29����\4\t����\4\v����\4!����\4\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n�\21\0\0\t\0!\1@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\b\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\5\0039\4\b\1'\6\24\0'\a\25\0'\b\26\0B\4\4\2>\4\6\0039\4\b\1'\6\27\0'\a\28\0'\b\29\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\a\0025\3\31\0=\3\30\0029\2 \0009\4\30\1B\2\2\1K\0\1\0\nsetup\1\0\2\nwidth\3\n\fspacing\3\1\topts\f:qa<CR>\15   exit\6q5:cd ~/.config/nvim <BAR>:Telescope git_files<CR>\15   dots\6p :Telescope file_browser<CR>\18   explore\6y\20:cd ~/work <CR>\15   work\6w;:cd ~/projects/solid-a3 <BAR>:Telescope find_files<CR>\19   solid-a3\6s!<cmd>:Telescope oldfiles<CR>\18   recents\6r/:e ~/Documents/vimnotes.md <BAR>:Goyo <CR>\16   notes\6n\vbutton\fbuttons\1\19\0\0S                                                                              _                                    ██████                                    o                                ████▒▒▒▒▒▒████                                w                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                                                          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            w                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                                                        ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                                                    ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                                                  ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        �\1                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        k                        ██      ██      ████      ████                        S                                                                              S                                                                              \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\15����\4\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6~\ahl\20GitGutterChange\14topdelete\1\0\2\ttext\b‾\ahl\20GitGutterDelete\vdelete\1\0\2\ttext\6_\ahl\20GitGutterDelete\vchange\1\0\2\ttext\b│\ahl\20GitGutterChange\badd\1\0\0\1\0\2\ttext\b│\ahl\17GitGutterAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
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
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\31\0-6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\23\0035\4\24\0004\5\0\0=\5\14\0044\5\0\0=\5\25\0045\5\26\0=\5\16\0045\5\27\0=\5\18\0044\5\0\0=\5\20\0044\5\0\0=\5\22\4=\4\28\0034\4\0\0=\4\29\0034\4\0\0=\4\30\3B\1\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\14lualine_b\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\4\0\0\14dashboard\rNvimTree\vpacker\23section_separators\1\0\2\tleft\6 \nright\6 \25component_separators\1\0\2\tleft\6 \nright\6 \1\0\3\ntheme\tauto\18icons_enabled\1\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n�\2\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3B\1\2\1K\0\1\0\rmappings\vstatus\1\0\0\1\0\2\6B\16BranchPopup\14<leader>q\nClose\1\0\6!disable_context_highlighting\1\17disable_hint\1\18disable_signs\1\"disable_builtin_notifications\1\17auto_refresh\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
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
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\2�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\tjump\rjumpable\21select_prev_item\fvisible�\5\1\0\v\0'\0H6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\f\0009\a\n\0009\a\v\a)\t��B\a\2\2=\a\r\0069\a\n\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\n\0009\a\15\aB\a\1\2=\a\16\0069\a\n\0009\a\17\aB\a\1\2=\a\18\0069\a\n\0009\a\19\a5\t\20\0B\a\2\2=\a\21\0069\a\n\0003\t\22\0005\n\23\0B\a\3\2=\a\24\0069\a\n\0003\t\25\0B\a\2\2=\a\26\6=\6\n\0059\6\27\0009\6\28\0064\b\3\0005\t\29\0>\t\1\b5\t\30\0>\t\2\b4\t\3\0005\n\31\0>\n\1\tB\6\3\2=\6\28\0055\6$\0009\a \0015\t!\0005\n\"\0=\n#\tB\a\2\2=\a%\6=\6&\5B\3\2\0012\0\0�K\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\rnvim_lsp\n[LSP]\rnvim_lua\n[api]\vbuffer\n[buf]\fluasnip\v[snip]\tpath\v[path]\1\0\1\14with_text\1\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\0" },
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
    config = { "\27LJ\2\n�\1\0\1\6\2\n\0\25-\1\0\0008\1\0\1\14\0\1\0X\2\1�4\1\0\0006\2\0\0009\2\1\0029\2\2\0029\2\3\2B\2\1\0026\3\4\0009\3\5\0039\3\6\3\15\0\3\0X\4\a�6\3\a\0'\5\6\0B\3\2\0029\3\b\3\18\5\2\0B\3\2\2\18\2\3\0-\3\1\0=\3\t\1L\1\2\0\3�\1�\14on_attach\24update_capabilities\frequire\17cmp_nvim_lsp\vloaded\fpackage\29make_client_capabilities\rprotocol\blsp\bvim0\0\1\a\1\2\0\a\18\3\0\0009\1\0\0-\4\0\0009\6\1\0B\4\2\0A\1\1\1K\0\1\0\4�\tname\nsetup�\4\1\0\t\0$\00056\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\0015\3\21\0005\4\b\0006\5\6\0009\5\a\5\18\a\2\0B\5\2\2=\5\t\0045\5\n\0=\5\v\0049\5\f\0009\5\r\0055\a\14\0B\5\2\2=\5\15\0045\5\16\0=\2\17\0055\6\18\0=\6\19\5=\5\20\4=\4\22\0035\4\30\0005\5\28\0005\6\26\0005\a\24\0005\b\23\0=\b\25\a=\a\27\6=\6\29\5=\5\20\4=\4\31\0033\4 \0006\5\0\0'\a!\0B\5\2\0029\5\"\0053\a#\0B\5\2\0012\0\0�K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\0\16sumneko_lua\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\befm\1\0\0\rsettings\16rootMarkers\1\2\0\0\17package.json\14languages\1\0\0\rroot_dir\1\3\0\0\n.git/\6.\17root_pattern\tutil\17init_options\1\0\1\23documentFormatting\2\14filetypes\1\0\0\rtbl_keys\bvim\nsetup\19modules.lsp.ui\23modules.lsp.format\26modules.lsp.on_attach\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3B\1\2\1K\0\1\0\tview\1\0\2\nwidth\3(\tside\tleft\24update_focused_file\1\0\1\venable\2\21nvim_tree_ignore\1\5\0\0\t.git\17node_modules\v.cache\14.DS_Store\1\0\4\15update_cwd\2\16open_on_tab\1\18disable_netrw\1\15auto_close\1\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\14\0005\5\r\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\26context_commentstring\vconfig\15javascript\1\0\0\1\0\5\16jsx_element\15{/* %s */}\14__default\n// %s\fcomment\n// %s\18jsx_attribute\n// %s\17jsx_fragment\15{/* %s */}\1\0\1\venable\2\fautotag\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\21ensure_installed\15maintained\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\n�\2\0\0\t\0\17\0\0246\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\15\0005\5\5\0005\6\4\0=\6\6\0055\6\n\0005\a\a\0009\b\b\1=\b\t\a=\a\v\0065\a\f\0009\b\b\1=\b\t\a=\a\r\6=\6\14\5=\5\16\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-t>\22open_with_trouble\1\0\2\n<C-d>\1\n<C-u>\1\25file_ignore_patterns\1\0\0\1\4\0\0\17node_modules\14yarn.lock\19yarn-error.log\nsetup trouble.providers.telescope\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\nsigns\1\0\5\thint\b\fwarning\b\nother\b﫠\nerror\b\16information\b\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\vcancel\n<esc>\rprevious\6k\nclose\6q\tnext\6j\fpreview\6p\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\frefresh\6r\1\0\r\tmode\30lsp_workspace_diagnostics\16fold_closed\b\29use_lsp_diagnostic_signs\1\14fold_open\b\nwidth\0032\nicons\1\17indent_lines\2\rposition\nright\14auto_open\1\15auto_close\1\vheight\3\n\14auto_fold\1\17auto_preview\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dogrun"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/vim-dogrun",
    url = "https://github.com/wadackel/vim-dogrun"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/rsbear/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
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

-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n\15\0\1\2\0\0\0\2:\1\1\0L\1\2\0�\1\0\0\16\6\2\2\30-\0\0\0+\2\0\0-\3\1\0)\5\1\0004\6\3\0-\a\2\0'\t\0\0B\a\2\2>\a\1\6-\a\0\0+\t\0\0004\n\4\0-\v\2\0005\r\1\0B\v\2\2>\v\1\n-\v\3\0)\r\1\0B\v\2\2>\v\2\n-\v\4\0)\r\2\0-\14\5\0004\15\0\0B\v\4\0?\v\0\0B\a\3\0?\a\1\0B\3\3\0C\0\1\0\2�\6�\3�\4�\a�\15�\1\3\0\0\5\f\t\\item \5\a����\4\5����\4�\b\0\2\21\3\31\3�\0014\2\4\0-\3\0\0005\5\0\0B\3\2\2>\3\1\2-\3\1\0)\5\1\0'\6\1\0B\3\3\2>\3\2\2-\3\0\0005\5\2\0B\3\2\0?\3\0\0004\3\0\0\15\0\1\0X\4\b�-\4\1\0)\6\1\0009\a\3\1\18\t\a\0009\a\4\aB\a\2\0A\4\1\2>\4\2\2:\4\2\2=\4\3\0036\4\5\0009\4\6\4:\6\2\0:\6\1\6'\a\a\0B\4\3\2\15\0\4\0X\5\t�6\4\b\0009\4\t\4\18\6\2\0004\a\3\0-\b\0\0005\n\n\0B\b\2\0?\b\1\0B\4\3\1)\4\2\0006\5\v\0006\a\b\0009\a\f\a:\t\2\0:\t\1\t'\n\a\0+\v\2\0B\a\4\0A\5\0\4X\b7�6\n\b\0009\n\f\n\18\f\t\0'\r\r\0+\14\2\0B\n\4\2:\t\2\n\15\0\t\0X\n.�+\n\0\0\15\0\1\0X\v\15�8\v\t\1\15\0\v\0X\f\f�-\v\1\0\18\r\4\0'\14\14\0\18\15\t\0&\14\15\0148\14\14\1\18\16\14\0009\14\4\14B\14\2\0A\v\1\2\18\n\v\0X\v\4�-\v\1\0\18\r\4\0B\v\2\2\18\n\v\0006\v\b\0009\v\t\v\18\r\2\0004\14\4\0-\15\0\0004\17\3\0'\18\15\0\18\19\t\0'\20\r\0&\18\20\18>\18\1\17B\15\2\2>\15\1\14>\n\2\14-\15\0\0005\17\16\0B\15\2\0?\15\0\0B\v\3\1'\v\14\0\18\f\t\0&\v\f\v<\n\v\3\22\4\2\4E\b\3\3R\b�:\5\1\0:\5\1\5\6\5\17\0X\5#�+\5\0\0\15\0\1\0X\6\f�9\6\18\1\15\0\6\0X\a\t�-\6\1\0\18\b\4\0009\t\18\1\18\v\t\0009\t\4\tB\t\2\0A\6\1\2\18\5\6\0X\6\4�-\6\1\0\18\b\4\0B\6\2\2\18\5\6\0006\6\b\0009\6\t\6\18\b\2\0004\t\4\0-\n\0\0005\f\19\0B\n\2\2>\n\1\t>\5\2\t-\n\0\0005\f\20\0B\n\2\0?\n\0\0B\6\3\1=\5\18\3\22\4\2\0046\5\b\0009\5\21\5:\a\3\0B\5\2\2\b\5\2\0X\5/�6\5\5\0009\5\22\5:\a\3\0:\a\2\a'\b\23\0'\t\24\0B\5\4\2+\6\0\0\15\0\1\0X\a\f�9\a\25\1\15\0\a\0X\b\t�-\a\1\0\18\t\4\0009\n\25\1\18\f\n\0009\n\4\nB\n\2\0A\a\1\2\18\6\a\0X\a\4�-\a\1\0\18\t\4\0B\a\2\2\18\6\a\0006\a\b\0009\a\t\a\18\t\2\0004\n\4\0-\v\0\0005\r\26\0'\14\27\0\18\15\5\0'\16\r\0&\14\16\14>\14\2\rB\v\2\2>\v\1\n>\6\2\n-\v\0\0005\r\28\0B\v\2\0?\v\0\0B\a\3\1=\6\25\3\22\4\2\0046\5\b\0009\5\t\5\18\a\2\0004\b\3\0-\t\0\0005\v\29\0B\t\2\0?\t\1\0B\5\3\1-\5\2\0+\a\0\0\18\b\2\0B\5\3\2=\3\30\5L\5\2\0\3�\4�\2�\14old_state\1\2\0\0\b */\1\3\0\0\5\5\16 * @throws \1\2\0\0\b * \aex\5\r throws \tgsub\14tbl_count\1\3\0\0\5\5\1\3\0\0\b * \16 * @return \bret\tvoid\1\3\0\0\5\5\15 * @param \barg\6 \nsplit\vipairs\1\3\0\0\b * \5\16list_extend\bvim\a, \tfind\vstring\rget_text\ndescr\1\3\0\0\5\5\24A short Description\1\3\0\0\b/**\b * \a����\4\3����\4\2m\0\2\f\0\6\0\0186\2\0\0009\2\1\2\18\4\1\0'\5\2\0B\2\3\0024\3\0\0\18\6\2\0009\4\3\2B\4\2\4X\a\5�6\b\4\0009\b\5\b\18\n\3\0\18\v\a\0B\b\3\1E\a\3\2R\a�L\3\2\0\vinsert\ntable\nlines\6r\npopen\aio�\20\1\0\28\0\\\6�\0036\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0006\b\0\0'\n\t\0B\b\2\0029\b\n\b6\t\0\0'\v\t\0B\t\2\0029\t\v\t6\n\0\0'\f\t\0B\n\2\0029\n\f\n6\v\0\0'\r\t\0B\v\2\0029\v\r\v6\f\0\0'\14\t\0B\f\2\0029\f\14\f6\r\0\0'\15\t\0B\r\2\0029\r\15\r9\14\16\0009\14\17\0145\16\18\0B\14\2\0013\14\19\0+\15\0\0003\15\20\0003\16\21\0003\17\22\0005\18Z\0004\19\17\0\18\20\1\0'\22\24\0004\23\b\0\18\24\3\0005\26\25\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26\26\0B\24\2\2>\24\3\23\18\24\4\0)\26\2\0'\27\27\0B\24\3\2>\24\4\23\18\24\3\0005\26\28\0B\24\2\2>\24\5\23\18\24\4\0)\26\0\0B\24\2\2>\24\6\23\18\24\3\0005\26\29\0B\24\2\0?\24\0\0B\20\3\2>\20\1\19\18\20\1\0'\22\30\0004\23\a\0\18\24\3\0005\26\31\0B\24\2\2>\24\1\23\18\24\3\0'\26 \0B\24\2\2>\24\2\23\18\24\4\0)\26\1\0B\24\2\2>\24\3\23\18\24\3\0'\26!\0B\24\2\2>\24\4\23\18\24\4\0)\26\2\0B\24\2\2>\24\5\23\18\24\3\0'\26\"\0B\24\2\0?\24\1\0B\20\3\2>\20\2\19\18\20\1\0'\22#\0004\23\15\0\18\24\3\0005\26$\0B\24\2\2>\24\1\23\18\24\3\0'\26%\0B\24\2\2>\24\2\23\18\24\4\0)\26\1\0B\24\2\2>\24\3\23\18\24\3\0005\26&\0B\24\2\2>\24\4\23\18\24\3\0'\26'\0B\24\2\2>\24\5\23\18\24\3\0005\26(\0B\24\2\2>\24\6\23\18\24\3\0005\26)\0B\24\2\2>\24\a\23\18\24\3\0005\26*\0B\24\2\2>\24\b\23\18\24\3\0005\26+\0B\24\2\2>\24\t\23\18\24\3\0005\26,\0B\24\2\2>\24\n\23\18\24\3\0005\26-\0B\24\2\2>\24\v\23\18\24\3\0005\26.\0B\24\2\2>\24\f\23\18\24\3\0005\26/\0B\24\2\2>\24\r\23\18\24\3\0005\0260\0B\24\2\0?\24\2\0B\20\3\2>\20\3\19\18\20\1\0'\0221\0004\23\5\0\18\24\3\0005\0262\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\0263\0B\24\2\0?\24\3\0B\20\3\2>\20\4\19\18\20\1\0'\0224\0004\23\5\0\18\24\3\0005\0265\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\0266\0B\24\2\0?\24\3\0B\20\3\2>\20\5\19\18\20\1\0'\0227\0004\23\5\0\18\24\3\0005\0268\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\0269\0B\24\2\0?\24\3\0B\20\3\2>\20\6\19\18\20\1\0'\22:\0004\23\5\0\18\24\3\0005\26;\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26<\0B\24\2\0?\24\3\0B\20\3\2>\20\a\19\18\20\1\0'\22=\0004\23\5\0\18\24\3\0005\26>\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26?\0B\24\2\0?\24\3\0B\20\3\2>\20\b\19\18\20\1\0'\22@\0004\23\5\0\18\24\3\0005\26A\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26B\0B\24\2\0?\24\3\0B\20\3\2>\20\t\19\18\20\1\0'\22C\0004\23\5\0\18\24\3\0005\26D\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26E\0B\24\2\0?\24\3\0B\20\3\2>\20\n\19\18\20\1\0'\22F\0004\23\5\0\18\24\3\0005\26G\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26H\0B\24\2\0?\24\3\0B\20\3\2>\20\v\19\18\20\1\0'\22I\0004\23\5\0\18\24\3\0005\26J\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26K\0B\24\2\0?\24\3\0B\20\3\2>\20\f\19\18\20\1\0'\22L\0004\23\5\0\18\24\3\0005\26M\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26N\0B\24\2\0?\24\3\0B\20\3\2>\20\r\19\18\20\1\0'\22O\0004\23\5\0\18\24\3\0005\26P\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0'\26'\0B\24\2\2>\24\3\23\18\24\3\0'\26Q\0B\24\2\0?\24\3\0B\20\3\2>\20\14\19\18\20\1\0'\22R\0004\23\5\0\18\24\3\0005\26S\0B\24\2\2>\24\1\23\18\24\3\0005\26T\0B\24\2\2>\24\2\23\18\24\4\0)\26\1\0B\24\2\2>\24\3\23\18\24\3\0005\26U\0B\24\2\0?\24\3\0B\20\3\2>\20\15\19\18\20\1\0'\22V\0004\23\6\0\18\24\3\0005\26W\0B\24\2\2>\24\1\23\18\24\4\0)\26\1\0B\24\2\2>\24\2\23\18\24\3\0005\26X\0B\24\2\2>\24\3\23\18\24\4\0)\26\0\0B\24\2\2>\24\4\23\18\24\3\0005\26Y\0B\24\2\0?\24\4\0B\20\3\0?\20\5\0=\19[\18=\18\23\0002\0\0�K\0\1\0\ball\1\0\0\1\2\0\0\6>\1\2\0\0\b></\1\2\0\0\6<\atg\1\2\0\0\t' />\1\2\0\0\18placeholder='\1\2\0\0\24<input onChange={} \ninput\n</h6>\1\2\0\0\n<h6 >\ah6\n</h5>\1\2\0\0\n<h5 >\ah5\n</h4>\1\2\0\0\n<h4 >\ah4\n</h3>\1\2\0\0\n<h3 >\ah3\n</h2>\1\2\0\0\n<h2 >\ah2\n</h1>\1\2\0\0\n<h1 >\ah1\t</a>\1\2\0\0\t<a >\6a\14</button>\1\2\0\0'<button type='button' onClick={} >\vbutton\f</span>\1\2\0\0\f<span >\tspan\t</p>\1\2\0\0\t<p >\6p\v</div>\1\2\0\0\v<div >\bdiv\1\2\0\0\20export default \1\3\0\0\6}\6\t\1\2\0\0\6)\1\3\0\0\v</div>\6\t\1\3\0\0\n</h1>\6\t\1\2\0\0\6\t\1\2\0\0\t<h1>\1\3\0\0\n<div>\6\t\1\3\0\0\rreturn (\6\t\6\t\1\3\0\0\24 :FC<any> = () => {\6\t\vconst \1\3\0\0\31import { FC } from 'react'\6\t\brfc\6)\f  ---',\6'\1\2\0\0\17console.log(\bclg\1\3\0\0\5\6}\1\3\0\0\b) {\6\t\barg\6(\1\3\0\0\5\14function \afn\rsnippets\0\0\0\0\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\19dynamic_lambda\rnonempty\nmatch\fpartial\brep\vlambda\19luasnip.extras\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\15����\4\r����\4\29����\4\t����\4\v����\4!����\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n�\21\0\0\t\0!\1@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\b\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\5\0039\4\b\1'\6\24\0'\a\25\0'\b\26\0B\4\4\2>\4\6\0039\4\b\1'\6\27\0'\a\28\0'\b\29\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\a\0025\3\31\0=\3\30\0029\2 \0009\4\30\1B\2\2\1K\0\1\0\nsetup\1\0\2\nwidth\3\n\fspacing\3\1\topts\f:qa<CR>\15   exit\6q5:cd ~/.config/nvim <BAR>:Telescope git_files<CR>\15   dots\6p :Telescope file_browser<CR>\18   explore\6y\20:cd ~/work <CR>\15   work\6w;:cd ~/projects/solid-a3 <BAR>:Telescope find_files<CR>\19   solid-a3\6s!<cmd>:Telescope oldfiles<CR>\18   recents\6r/:e ~/Documents/vimnotes.md <BAR>:Goyo <CR>\16   notes\6n\vbutton\fbuttons\1\19\0\0S                                                                              _                                    ██████                                    o                                ████▒▒▒▒▒▒████                                w                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                                                          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            w                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                                                        ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                                                    ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                                                  ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        �\1                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        �\1                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        k                        ██      ██      ████      ████                        S                                                                              S                                                                              \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\15����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\t\0\17\0\0246\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\15\0005\5\5\0005\6\4\0=\6\6\0055\6\n\0005\a\a\0009\b\b\1=\b\t\a=\a\v\0065\a\f\0009\b\b\1=\b\t\a=\a\r\6=\6\14\5=\5\16\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\n<C-t>\22open_with_trouble\1\0\2\n<C-d>\1\n<C-u>\1\25file_ignore_patterns\1\0\0\1\4\0\0\17node_modules\14yarn.lock\19yarn-error.log\nsetup trouble.providers.telescope\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\1\0\1\6\2\n\0\25-\1\0\0008\1\0\1\14\0\1\0X\2\1�4\1\0\0006\2\0\0009\2\1\0029\2\2\0029\2\3\2B\2\1\0026\3\4\0009\3\5\0039\3\6\3\15\0\3\0X\4\a�6\3\a\0'\5\6\0B\3\2\0029\3\b\3\18\5\2\0B\3\2\2\18\2\3\0-\3\1\0=\3\t\1L\1\2\0\3�\1�\14on_attach\24update_capabilities\frequire\17cmp_nvim_lsp\vloaded\fpackage\29make_client_capabilities\rprotocol\blsp\bvim0\0\1\a\1\2\0\a\18\3\0\0009\1\0\0-\4\0\0009\6\1\0B\4\2\0A\1\1\1K\0\1\0\4�\tname\nsetup�\4\1\0\t\0$\00056\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\0015\3\21\0005\4\b\0006\5\6\0009\5\a\5\18\a\2\0B\5\2\2=\5\t\0045\5\n\0=\5\v\0049\5\f\0009\5\r\0055\a\14\0B\5\2\2=\5\15\0045\5\16\0=\2\17\0055\6\18\0=\6\19\5=\5\20\4=\4\22\0035\4\30\0005\5\28\0005\6\26\0005\a\24\0005\b\23\0=\b\25\a=\a\27\6=\6\29\5=\5\20\4=\4\31\0033\4 \0006\5\0\0'\a!\0B\5\2\0029\5\"\0053\a#\0B\5\2\0012\0\0�K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\0\16sumneko_lua\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\befm\1\0\0\rsettings\16rootMarkers\1\2\0\0\17package.json\14languages\1\0\0\rroot_dir\1\3\0\0\n.git/\6.\17root_pattern\tutil\17init_options\1\0\1\23documentFormatting\2\14filetypes\1\0\0\rtbl_keys\bvim\nsetup\19modules.lsp.ui\23modules.lsp.format\26modules.lsp.on_attach\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\14\0005\5\r\0=\5\15\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\26context_commentstring\vconfig\15javascript\1\0\0\1\0\5\16jsx_element\15{/* %s */}\14__default\n// %s\fcomment\n// %s\18jsx_attribute\n// %s\17jsx_fragment\15{/* %s */}\1\0\1\venable\2\fautotag\1\0\1\venable\2\14autopairs\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\21ensure_installed\15maintained\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6~\ahl\20GitGutterChange\14topdelete\1\0\2\ttext\b‾\ahl\20GitGutterDelete\vdelete\1\0\2\ttext\6_\ahl\20GitGutterDelete\vchange\1\0\2\ttext\b│\ahl\20GitGutterChange\badd\1\0\0\1\0\2\ttext\b│\ahl\17GitGutterAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\31\0-6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\4=\4\23\0035\4\24\0004\5\0\0=\5\14\0044\5\0\0=\5\25\0045\5\26\0=\5\16\0045\5\27\0=\5\18\0044\5\0\0=\5\20\0044\5\0\0=\5\22\4=\4\28\0034\4\0\0=\4\29\0034\4\0\0=\4\30\3B\1\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\14lualine_b\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\4\0\0\14dashboard\rNvimTree\vpacker\23section_separators\1\0\2\tleft\6 \nright\6 \25component_separators\1\0\2\tleft\6 \nright\6 \1\0\3\ntheme\tauto\18icons_enabled\1\25always_divide_middle\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3B\1\2\1K\0\1\0\tview\1\0\2\nwidth\3(\tside\tleft\24update_focused_file\1\0\1\venable\2\21nvim_tree_ignore\1\5\0\0\t.git\17node_modules\v.cache\14.DS_Store\1\0\4\15update_cwd\2\16open_on_tab\1\18disable_netrw\1\15auto_close\1\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3B\1\2\1K\0\1\0\rmappings\vstatus\1\0\0\1\0\2\6B\16BranchPopup\14<leader>q\nClose\1\0\6!disable_context_highlighting\1\17disable_hint\1\18disable_signs\1\"disable_builtin_notifications\1\17auto_refresh\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\2�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\2�\tjump\rjumpable\21select_prev_item\fvisible�\5\1\0\v\0'\0H6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\f\0009\a\n\0009\a\v\a)\t��B\a\2\2=\a\r\0069\a\n\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\n\0009\a\15\aB\a\1\2=\a\16\0069\a\n\0009\a\17\aB\a\1\2=\a\18\0069\a\n\0009\a\19\a5\t\20\0B\a\2\2=\a\21\0069\a\n\0003\t\22\0005\n\23\0B\a\3\2=\a\24\0069\a\n\0003\t\25\0B\a\2\2=\a\26\6=\6\n\0059\6\27\0009\6\28\0064\b\3\0005\t\29\0>\t\1\b5\t\30\0>\t\2\b4\t\3\0005\n\31\0>\n\1\tB\6\3\2=\6\28\0055\6$\0009\a \0015\t!\0005\n\"\0=\n#\tB\a\2\2=\a%\6=\6&\5B\3\2\0012\0\0�K\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\5\rnvim_lsp\n[LSP]\rnvim_lua\n[api]\vbuffer\n[buf]\fluasnip\v[snip]\tpath\v[path]\1\0\1\14with_text\1\15cmp_format\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\nsigns\1\0\5\thint\b\fwarning\b\nother\b﫠\nerror\b\16information\b\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\vcancel\n<esc>\rprevious\6k\nclose\6q\tnext\6j\fpreview\6p\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\frefresh\6r\1\0\r\tmode\30lsp_workspace_diagnostics\16fold_closed\b\29use_lsp_diagnostic_signs\1\14fold_open\b\nwidth\0032\nicons\1\17indent_lines\2\rposition\nright\14auto_open\1\15auto_close\1\vheight\3\n\14auto_fold\1\17auto_preview\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

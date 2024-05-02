-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("GeistMono Nerd Font", { weight = "Medium", italic = false })
config.font_size = 17.0
config.line_height = 1.2
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.max_fps = 144
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false

-- This is where you actually apply your config choices

-- https://wezfurlong.org/wezterm/config/appearance.html#tab-bar-appearance-colors
-- local bg = "#11121E" -- tokyodark
-- local bg = "#161616" -- oxocarbon
-- local bg = "#1E1E1E" -- vscode
local bg = "#181818" -- fleet
config.colors = {
	background = bg,
	tab_bar = {
		background = bg,
		active_tab = {
			bg_color = "#05a8aa",
			fg_color = "#ffffff",
			intensity = "Normal", -- Half, Normal, Bold
			underline = "None", -- None, Single, Double
			italic = false,
		},
		inactive_tab = {
			bg_color = bg,
			fg_color = "#808080",
		},
		inactive_tab_hover = {
			bg_color = bg,
			fg_color = "#909090",
			italic = true,
		},
		new_tab = {
			bg_color = bg,
			fg_color = "#808080",
		},
		new_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = "GeistMono Nerd Font" }),
	font_size = 14.0,
	active_titlebar_bg = bg,
	inactive_titlebar_bg = bg,
}

-- and finally, return the configuration to wezterm
return config

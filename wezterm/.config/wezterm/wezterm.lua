local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("Noto Sans Mono")
config.color_scheme = "rose-pine"
config.window_background_opacity = 0.8
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell",
}
config.hide_tab_bar_if_only_one_tab = true

return config

local wezterm = require("wezterm")
local config = {}
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 16.0
config.default_prog = { "/opt/homebrew/bin/tmux" }
config.macos_window_background_blur = 15
config.enable_tab_bar = false

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

return config

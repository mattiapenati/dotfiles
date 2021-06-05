local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.cell_width = 1.05
config.color_scheme = "Kanagawa (Gogh)"
-- config.disable_default_mouse_bindings = true
config.font = wezterm.font("Cascadia Mono NF")
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true
config.line_height = 1.05
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

return config

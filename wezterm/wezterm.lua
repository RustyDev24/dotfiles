local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({
    "FantasqueSansM Nerd Font",
})

config.font_size = 13.0

config.color_scheme = "Tokyo Night Storm"

config.use_fancy_tab_bar = false

config.enable_scroll_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.enable_wayland = false

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

return config

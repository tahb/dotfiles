-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {
  color_scheme = 'Afterglow',
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Fira Code"
  }),
  font_size = 20.0,
  default_cursor_style = "BlinkingBlock",
  adjust_window_size_when_changing_font_size = false,
  initial_cols = 120,
}

-- and finally, return the configuration to wezterm
return config

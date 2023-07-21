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

  -- Word jumping left and right
  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  }
}

-- and finally, return the configuration to wezterm
return config

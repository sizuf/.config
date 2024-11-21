local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.keys = {
  {
    key = 'v',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

}
config.font_size = 16


return config

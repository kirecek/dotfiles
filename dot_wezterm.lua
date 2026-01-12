local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local scheme = wezterm.get_builtin_color_schemes()['GruvboxDarkHard']

scheme.background = '#1d2021'

scheme.tab_bar = {
    inactive_tab_edge = '#1d2021',

    active_tab = {
        bg_color = '#1d2021',
        fg_color = '#ffffff',
    },
    inactive_tab = {
        bg_color = '#1d2021',
        fg_color = '#333333',
    },
}

config.window_frame = {
  font_size = 12.0,
  active_titlebar_bg = '#1d2021',
  inactive_titlebar_bg = '#1d2021',
}

config.color_schemes = {
    ['My'] = scheme,
}
config.color_scheme = 'My'

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 11

return config

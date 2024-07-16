local colors = require("plugins.theme.colors").colors
return {
  fill = {
    fg = colors.fg,
    bg = colors.bg,
  },
  background = {
    fg = colors.fg,
    bg = colors.bg,
  },
  tab = {
    fg = colors.fg,
    bg = colors.bg,
  },
  tab_selected = {
    fg = colors.cyan,
    bg = colors.bg,
  },
  close_button_selected = {
    fg = colors.fg_dark,
    bg = colors.bg,
  },
  buffer_selected = {
    fg = colors.cyan,
    bg = colors.bg,
  },
  trunc_marker = {
    fg = colors.fg_dark,
    bg = colors.bg,
  }
}

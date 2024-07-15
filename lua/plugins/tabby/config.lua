local colors = require("plugins.theme.colors").colors
local theme = {
  fill = { bg = colors.bg },
  head = { bg = colors.bg, fg = colors.blue },
  current_tab = { bg = colors.bg, fg = colors.cyan },
  tab = { bg = colors.bg, fg = colors.fg },
  win = { bg = colors.bg, fg = colors.fg },
  tail = { bg = colors.bg, fg = colors.violet }
}
require('tabby').setup({
  line = function(line)
    return {
      {
        { '  ', hl = theme.head },
        line.sep('█', theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep('█', hl, theme.fill),
          "",
          "",
          tab.name(),
          tab.close_btn(''),
          line.sep('', hl, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),
      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        local hl = win.is_current() and theme.current_tab or theme.win
        return {
          line.sep('', theme.fill, theme.fill),
          '',
          win.buf_name(),
          line.sep('', theme.win, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),
      {
        line.sep('█', theme.tail, theme.fill),
        { '  ', hl = theme.tail },
      },
      hl = theme.fill,
    }
  end,
  option = {
    tab_name = {
      name_fallback = function(tabid)
        return "Tab " .. tabid
      end
    },
    buf_name = "relative",
  }, -- setup modules' option,
})

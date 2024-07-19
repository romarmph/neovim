---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  cache = false,
  style = 'night',
  transparent = true,
  terminal_colors = true,
  styles = {
    sidebars = 'transparent',
    floats = 'transparent',
  },
  on_highlights = function(highlights, colors)
    highlights['@function'] = { fg = colors.blue }
    highlights['@function.builtin'] = { fg = colors.yellow }
    highlights['@variable.builtin'] = { fg = colors.fg_dark }
    highlights['@keyword.exception'] = { fg = colors.magenta2 }
    highlights['@keyword.import'] = { fg = colors.cyan }
  end
}

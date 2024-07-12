return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
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
    }
    vim.cmd.colorscheme 'tokyonight'
    require('plugins.theme.highlights')
  end,
}

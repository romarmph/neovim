return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("plugins.theme.config")
    vim.cmd.colorscheme 'tokyonight'
    require('plugins.theme.highlights')

  end,
}

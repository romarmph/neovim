return {
  {
    "tiagovla/tokyodark.nvim",
    cond = false,
    config = function(_)
      require("plugins.theme.tokyodark")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        terminal_colors = true,
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
        },
      })
      vim.cmd [[colorscheme tokyonight]]
    end
  }
}

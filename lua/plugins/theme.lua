return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          sidebars = 'transparent',
          floats = 'transparent',
        },
        on_highlights = function(highlights, colors)
          local vscolors = require("plugins.theme.vs-tokyonigt-colors")
          highlights['@comment'] = { fg = vscolors.neutral_4 }
        end
      })
      vim.cmd [[colorscheme tokyonight]]
      require("plugins.theme.highlights")
    end
  }
}

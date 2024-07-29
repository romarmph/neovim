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
          highlights['@function'] = { fg = colors.blue }
          highlights['@function.builtin'] = { fg = colors.yellow }
          highlights['@variable.builtin'] = { fg = colors.fg_dark }
          highlights['@keyword.exception'] = { fg = colors.magenta2 }
          highlights['@keyword.import'] = { fg = colors.cyan }
        end
      })
      vim.cmd [[colorscheme tokyonight]]
      require("plugins.theme.highlights")
    end
  }
}

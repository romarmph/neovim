require("tokyodark").setup({
  transparent_background = true,
  terminal_colors = true,
  custom_palette = function(colors)
    return {
    }
  end
})
vim.cmd [[colorscheme tokyodark]]

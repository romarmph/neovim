return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local config = require("plugins.lualine.config")
    require("lualine").setup(config)
  end
}

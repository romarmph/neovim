return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("hardtime").setup {
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "neo-tree"},
      disable_mouse = false,
    }
  end
}

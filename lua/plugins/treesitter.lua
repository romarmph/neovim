return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function(_, opts)
      require("plugins.treesitter.config")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function ()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            }
          }
        }
      })
    end
  }
}

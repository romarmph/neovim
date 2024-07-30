return {
  {
    'lewis6991/gitsigns.nvim',
    event = "BufEnter",
    config = function()
      local gitsigns = require("gitsigns")

      gitsigns.setup({
        signs = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '┃' },
          topdelete = { text = '┃' },
          changedelete = { text = '┃' },
          untracked = { text = "┆" }
        },
        attach_to_untracked = true,
      })
    end
  }
}

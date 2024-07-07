return {
  {
    "smjonas/inc-rename.nvim",
    config = function()
      ---@diagnostic disable-next-line: missing-parameter
      require("inc_rename").setup({
        presets = { inc_rename = true }
      })

      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })
    end,
  }
}

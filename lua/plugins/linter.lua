return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      source = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,

        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.refactoring
      }
    })

    vim.keymap.set('n', '<leader>fd', vim.lsp.buf.format, { desc = 'Format Document'})
  end
}

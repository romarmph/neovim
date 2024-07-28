return {
   "nvimtools/none-ls.nvim",
  event = "BufEnter",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      source = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,

        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.code_actions.refactoring
      }
    })

    vim.keymap.set('n', '<leader>fd', vim.lsp.buf.format, { desc = 'Format Document' })
    vim.api.nvim_create_autocmd('BufWritePost', {
      desc = 'Format on save',
      group = vim.api.nvim_create_augroup('custom-format-on-save', { clear = true }),
      callback = function()
        vim.lsp.buf.format()
      end
    })
  end
}

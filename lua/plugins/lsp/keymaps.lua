local M = {}

function M.create_keymaps(event, telescope)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end

  map('gd', telescope.lsp_definitions, 'Go to Definition')
  map('gr', telescope.lsp_references, 'Go to References ')
  map('gI', telescope.lsp_implementations, 'Go to Implementation')
  map('<leader>rn', vim.lsp.buf.rename, 'Rename Symbol')
  vim.keymap.set({ 'n', 'v', }, '<leader>ca', vim.lsp.buf.code_action,
    { buffer = event.buf, desc = 'LSP: Code Actions' })
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('gD', vim.lsp.buf.declaration, 'Go to Declaration')
  map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
  map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
  map('<leader>q', vim.diagnostic.setloclist, 'Next Diagnostic')

end

return M

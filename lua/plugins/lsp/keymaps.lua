local M = {}

function M.create_keymaps(event, telescope)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end

  map('gd', telescope.lsp_definitions, 'Go to Definition')
  map('gr', telescope.lsp_definitions, 'Go to References ')
  map('gI', telescope.lsp_definitions, 'Go to Implementation')
  map('<leader>D', telescope.lsp_definitions, 'Type Definition')
  map('<leader>ds', telescope.lsp_document_symbols, 'Document Symbols')
  map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
  vim.keymap.set({ 'n', 'v', }, '<leader>ca', vim.lsp.buf.code_action,
    { buffer = event.buf, desc = 'LSP: Code Actions' })
  map('K', vim.lsp.buf.hover, 'Hover Documentation')

  map('gD', vim.lsp.buf.declaration, 'Go to Declaration')
end

return M


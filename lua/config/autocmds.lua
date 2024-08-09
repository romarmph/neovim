vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client ~= nil then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
});

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('custom-hightlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

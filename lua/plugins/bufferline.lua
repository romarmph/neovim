return {
  'akinsho/bufferline.nvim',
  event = 'BufEnter',
  config = function()
    require("plugins.bufferline.config")
    require("plugins.bufferline.keymaps")
  end,
}

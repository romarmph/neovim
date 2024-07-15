
return {
  'nanozuki/tabby.nvim',
  cond = false,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("plugins.tabby.config")
    require("plugins.tabby.keymaps")
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
   dependencies = {
    { 'windwp/nvim-ts-autotag' },
  },
  config = function(_, _)
    require('nvim-treesitter.configs').setup  {
    ensure_installed = {
      'lua',
      'css',
      'fish',
      'javascript',
      'typescript',
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
  }
    require('nvim-ts-autotag').setup()
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
   dependencies = {
    { 'windwp/nvim-ts-autotag' },
  },
  config = function(_, opts)
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
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
    dent = { enable = true, disable = { 'ruby' } },
  }
    require('nvim-ts-autotag').setup()
  end,
}

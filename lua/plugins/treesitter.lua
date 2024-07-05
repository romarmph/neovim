return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
   dependencies = {
    { 'windwp/nvim-ts-autotag' },
  },
  opts = {
    ensure_installed = {
      'bash',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'css',
      'fish',
      'svelte',
      'javascript',
      'typescript',
      'gitignore',
      'go',
      'http',
      'scss',
      'sql',
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
  },
   config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
    require('nvim-ts-autotag').setup()
  end,
}

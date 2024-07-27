--@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'json',
    'jsonc',
    'python',
    'vim',
    'vimdoc',
    'yaml',
    'toml',
    'html',
    'lua',
    'css',
    'fish',
    'javascript',
    'typescript',
    'svelte',
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

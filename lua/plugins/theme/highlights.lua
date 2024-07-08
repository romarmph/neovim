local colors = {
  bg = '#141724',
  fg = '#7982a9',
  yellow = '#b89933',
  cyan = '#20a3c7',
  darkblue = '#081633',
  green = '#45deaf',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#2b96fb',
  red = '#ec5f67',
  segmentBg = '#090a1a',
}

vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NeoTreeGitRenamed', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#303548' })
vim.api.nvim_set_hl(0, 'IblScope', { fg = '#303548' })

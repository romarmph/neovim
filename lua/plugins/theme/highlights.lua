local colors = require("plugins.theme.colors").colors

-- NeoTree
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NeoTreeGitRenamed', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', { fg = colors.yellow })

-- Indent Blank Line
vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#303548' })
vim.api.nvim_set_hl(0, 'IblScope', { fg = '#303548' })

local colors = require("plugins.theme.colors").colors

vim.cmd([[
  augroup CursorLineTransparency
    autocmd!
    autocmd ColorScheme * highlight CursorLine guibg=#0f0f0f ctermbg=none
  augroup END
]])

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

-- Bufferline
vim.api.nvim_set_hl(0, 'BufferLineSeparator', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineGroupSeparator', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineTabSeparatorSelected', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { bg = '#14141c', fg = '#14141c' })
vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { bg = '#1b1b2e' })

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = "#1f2533" })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = '#1f2533' })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#7982a9' })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = '#7982a9' })

-- LSP
vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = '#8289B3' })


-- Font
vim.cmd.hi 'Comment gui=NONE'

-- vim
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1d1d2b' })


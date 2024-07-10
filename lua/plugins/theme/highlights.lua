local colors = require("plugins.theme.colors").colors

vim.cmd([[
  augroup CursorLineTransparency
    autocmd!
    autocmd ColorScheme * highlight CursorLine guibg=#0f0f0f ctermbg=none
  augroup END
]])

local set_highlight = function(group, highlight)
  vim.api.nvim_set_hl(0, group, highlight)
end

local set_multiple_highlights = function(group, highlights)
  for _, name in ipairs(group) do
    set_highlight(name, highlights)
  end
end

-- NeoTree
set_highlight('NeoTreeDirectoryName', { fg = colors.fg })
set_highlight('NeoTreeDirectoryIcon', { fg = colors.fg })
set_highlight('NeoTreeFloatBorder', { fg = colors.fg })
set_highlight('NeoTreeGitModified', { fg = colors.blue })
set_highlight('NeoTreeGitRenamed', { fg = colors.cyan })
set_highlight('NeoTreeGitDeleted', { fg = colors.red })
set_highlight('NeoTreeGitAdded', { fg = colors.green })
set_highlight('NeoTreeGitUntracked', { fg = colors.orange })
set_highlight('NeoTreeGitUnstaged', { fg = colors.yellow })

-- Indent Blank Line
set_multiple_highlights({ 'IblIndent', 'IblScope' }, { fg = '#303548' })

-- Bufferline
set_multiple_highlights({
  'BufferLineSeparator',
  'BufferLineGroupSeparator',
  'BufferLineTabSeparatorSelected',
  'BufferLineSeparatorSelected',
  'BufferLineSeparatorVisible',
  'BufferLineIndicatorSelected',
  'BufferLineIndicatorVisible',
  '',
}, { bg = '#14141c', fg = '#14141c' })

set_multiple_highlights({ 'BufferLineCloseButtonSelected', 'BufferLineDevIconluaSelected' },
  { bg = '#1b1b2e', fg = '#3d3d54' })

set_multiple_highlights({ 'BufferLineDevIconluaInactive', 'BufferLineDevIconlua' }, { fg = '#3d3d54' })

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

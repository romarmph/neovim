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
set_multiple_highlights({
  'NeoTreeDirectoryName',
  'NeoTreeDirectoryIcon',
 'NeoTreeFloatBorder',
}, { fg = colors.fg })
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
}, { bg = '#16161f', fg = '#16161f' })
set_multiple_highlights({ 'BufferLineCloseButtonSelected', 'BufferLineDevIconluaSelected' },
  { bg = '#16161f', fg = '#3d3d54' })
set_multiple_highlights({ 'BufferLineDevIconluaInactive', 'BufferLineDevIconlua' }, { fg = '#3d3d54' })
set_highlight('BufferLineBufferSelected', { bg = '#16161f' })

-- Telescope
set_highlight('TelescopeBorder', { fg = "#1f2533" })
set_highlight('TelescopePromptBorder', { fg = '#1f2533' })
set_highlight('TelescopePromptTitle', { fg = '#7982a9' })
set_highlight('TelescopeResultsTitle', { fg = '#7982a9' })

-- LSP
set_highlight('DiagnosticUnnecessary', { fg = '#8289B3' })


-- Font
vim.cmd.hi 'Comment gui=NONE'
-- vim
set_highlight('CursorLine', { bg = '#1d1d2b' })

-- Illuminate
set_multiple_highlights({
  'IlluminatedWordRead',
  'IlluminatedWordWrite',
  'IlluminatedWordText',
}, { bg = '#2c2c4d' })

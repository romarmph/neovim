local colors = require("plugins.theme.colors").colors
local set_highlight = require("utils.highlights").set_highlight
local set_multiple_highlights = require("utils.highlights").set_multiple_highlights


-- NeoTree
set_multiple_highlights({
  'NeoTreeDirectoryName',
  'NeoTreeDirectoryIcon',
}, { fg = colors.fg })
set_highlight('NeoTreeGitModified', { fg = colors.blue })
set_highlight('NeoTreeGitRenamed', { fg = colors.cyan })
set_highlight('NeoTreeGitDeleted', { fg = colors.red })
set_highlight('NeoTreeGitAdded', { fg = colors.green })
set_highlight('NeoTreeGitUntracked', { fg = colors.orange })
set_highlight('NeoTreeGitUnstaged', { fg = colors.yellow })
set_highlight('NeoTreeFloatBorder', { fg = colors.fg })
set_highlight('NeoTreeFloatTitle', { fg = colors.fg })


set_multiple_highlights({ 'IblIndent', 'IblScope' }, { fg = colors.fg_dark })

-- Telescope
set_highlight('TelescopeBorder', { fg = colors.fg })
set_highlight('TelescopePromptBorder', { fg = colors.fg })
set_highlight('TelescopePromptTitle', { fg = colors.fg })
set_highlight('TelescopeResultsTitle', { fg = colors.fg })

-- LSP
set_highlight('DiagnosticUnnecessary', { fg = colors.fg })

-- vim
vim.cmd.hi 'Comment gui=NONE'
set_highlight('CursorLine', { bg = "NONE" })

-- Illuminate
set_multiple_highlights({
  'IlluminatedWordRead',
  'IlluminatedWordWrite',
  'IlluminatedWordText',
}, { bg = '#2c2c4d' })

set_highlight('WinSeparator', { fg = colors.fg_dark})
set_highlight('WhichKeyBorder', { fg = colors.fg_dark })

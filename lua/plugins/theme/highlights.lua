local colors = require("plugins.theme.colors")
local set_highlight = function(group, highlight)
  vim.api.nvim_set_hl(0, group, highlight)
end

local set_multiple = function(group, highlights)
  for _, name in ipairs(group) do
    set_highlight(name, highlights)
  end
end

set_multiple({
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


set_multiple({ 'IblIndent', 'IblScope' }, { fg = colors.fg_dark })

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
set_multiple({
  'IlluminatedWordRead',
  'IlluminatedWordWrite',
  'IlluminatedWordText',
}, { bg = '#2c2c4d' })

set_highlight('WinSeparator', { fg = colors.fg_dark })
set_highlight('WhichKeyBorder', { fg = colors.fg_dark })

set_highlight('GitSignsAdd', { fg = colors.green })
set_highlight('GitSignsChange', { fg = colors.blue })
set_highlight('GitSignsDelete', { fg = colors.red })
set_highlight('GitSignsTopdelete', { fg = colors.magenta })
set_highlight('GitSignsChangedelete', { fg = colors.orange })
set_highlight('GitSignsUntracked', { fg = colors.yellow })

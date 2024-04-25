vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = '#6f88b0' })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = '#666f75' })

vim.cmd [[
    highlight! link NeoTreeGitUntracked NeoTreeDirectoryName
    highlight! link NeoTreeGitUnstaged NeoTreeDirectoryName
    highlight! link NeoTreeGitModified NeoTreeDirectoryName
    highlight! link NeoTreeGitRenamed NeoTreeDirectoryName
    highlight! link NeoTreeGitAdded NeoTreeDirectoryName
    highlight! link NeoTreeGitDeleted NeoTreeDirectoryName
]]

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search Current Word' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search By Grep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files' })

vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, { desc = 'Workspace Symbols' })
vim.keymap.set('n', '<leader>lW', builtin.lsp_dynamic_workspace_symbols, { desc = 'Dynamic Workspace Symbols' })
vim.keymap.set('n', '<leader>lt', builtin.lsp_type_definitions, { desc = 'Type Definitions' })
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = 'Document Symbols' })
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, { desc = 'Implementations' })
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = 'Definitions' })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = 'References' })

vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find Buffers' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 0,
    previewer = false,
  })
end, { desc = 'Fuzzy Search in Current Buffer' })

vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live  Grep',
  }
end, { desc = 'Search in Open Files' })

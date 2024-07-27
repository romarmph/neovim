local g = vim.g
local keymap = vim.keymap

g.mapleader = ' '
g.maplocalleader = ' '

keymap.set('i', 'jk', '<esc>');
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap.set('n', '<A-Backspace>', '<cmd>LspRestart<CR>', { desc = 'Restart LSP' })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

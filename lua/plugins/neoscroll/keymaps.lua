local neoscroll = require('neoscroll')

vim.keymap.set(
  { 'n', 'v', 's' },
  '<C-u>',
  function()
    neoscroll.scroll(-vim.wo.scroll, true, 300, 'easeOutSine')
  end
)
vim.keymap.set(
  { 'n', 'v', 's' },
  '<C-d>',
  function()
    neoscroll.scroll(vim.wo.scroll, true, 300, 'easeOutSine')
  end
)


vim.keymap.set(
  { 'n', 'v', 's' },
  '<C-b>',
  function()
    neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 300, 'easeOutSine')
  end
)
vim.keymap.set(
  { 'n', 'v', 's' },
  '<C-f>',
  function()
    neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 300, 'easeOutSine')
  end
)

return {
  'akinsho/bufferline.nvim',
  event = 'BufEnter',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>',            desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>',          desc = 'Delete Other Buffers' },
    { '<leader>bd', '<Cmd>bp|sp|bn|bd!<CR>',                   desc = 'Delete Current Buffer' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>',           desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>',            desc = 'Delete Buffers to the Left' },
    { '<Tab>',      '<cmd>BufferLineCycleNext<cr>',            desc = 'Next Buffer' },
    { '<S-Tab>',    '<cmd>BufferLineCyclePrev<cr>',            desc = 'Prev Buffer' },
  },
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        mode = 'buffers',
        themable = true,
        separator_style = "thin",
        indicators = {
          style = 'underline'
        },
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
      },
    })
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd('BufAdd', {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}

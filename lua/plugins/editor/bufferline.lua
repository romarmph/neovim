local get_root_dir = require("utils").get_root_dir
local colors = require("plugins.theme.colors")
local bufferline = require('bufferline')
bufferline.setup({
  options = {
    style_preset = {
      bufferline.style_preset.no_bold,
      bufferline.style_preset.no_italic,
    },
    mode = 'buffers',
    themable = true,
    numbers = "none",
    indicator = {
      icon = "",
      style = "icon",
    },
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    truncate_names = true,
    offsets = {
      {
        filetype = "neo-tree",
        text = "󰉋 " .. get_root_dir(),
        text_align = "left",
        highlight = "NeoTreeDirectoryName",
        separator = false,
      }
    },
    color_icons = true,
    show_buffer_icons = false,
    show_close_icon = false,
    separator_style = { '', '' },
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    sort_by = "insert_at_end",
    custom_areas = {
      left = function()
        return {
          {
            text = " ",
            fg = colors.fg_dark,
          },
        }
      end,
    }
  },
  highlights = {
    fill = {
      fg = colors.fg,
      bg = colors.bg,
    },
    background = {
      fg = colors.fg,
      bg = colors.bg,
    },
    tab = {
      fg = colors.fg,
      bg = colors.bg,
    },
    tab_selected = {
      fg = colors.cyan,
      bg = colors.bg,
    },
    close_button_selected = {
      fg = colors.fg_dark,
      bg = colors.bg,
    },
    buffer_selected = {
      fg = colors.cyan,
      bg = colors.bg,
    },
    trunc_marker = {
      fg = colors.fg_dark,
      bg = colors.bg,
    }
  },
})

vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { desc = 'Toggle Pin' })
vim.keymap.set('n', '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'Delete Non-Pinned Buffers' })
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Delete Other Buffers' })
vim.keymap.set('n', '<leader>bd', '<Cmd>bp|sp|bn|bd!<CR>', { desc = 'Delete Current Buffer' })
vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Delete Buffers to the Right' })
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Delete Buffers to the Left' })
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })

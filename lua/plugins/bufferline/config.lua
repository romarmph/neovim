local getRootDir = require("utils.getRootDir")
local colors = require("plugins.theme.colors").colors
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
        text = "󰉋 " .. getRootDir(),
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
  highlights = require("plugins.bufferline.highlights"),
})

-- Fix bufferline when restoring a session
vim.api.nvim_create_autocmd('BufAdd', {
  callback = function()
    vim.schedule(function()
      pcall(nvim_bufferline)
    end)
  end,
})

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    local actions = require 'telescope.actions'

    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            width = 0.5,
            height = 0.75,
            preview_cutoff = 30,
            prompt_position = 'bottom',
          }
        },
        prompt_prefix = ' ',
        selection_caret = ' ',
        multi_icon = " "
      },
      pickers = {
        buffers = {
          i = {
            ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
          }
        }
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    require("plugins.telescope.keymaps")
  end
}

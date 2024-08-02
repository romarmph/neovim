return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
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

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('ui-select')

    local builtin = require 'telescope.builtin'
    local keymap = vim.keymap
    keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
    keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
    keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
    keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
    keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search Current Word' })
    keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search By Grep' })
    keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
    keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
    keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files' })
    keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search buffers' })
    keymap.set('n', '<leader>/', function ()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        previewer = false,
      })
    end, { desc = 'Search in current buffer'})
    keymap.set('n', '<leader>s/', function ()
      builtin.live_grep({
        grep_open_files = true,
      })
    end, { desc = 'Search in Open files'})
  end
}

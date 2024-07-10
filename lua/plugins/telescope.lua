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
  end
}

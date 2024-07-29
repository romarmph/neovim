return {
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "DaikyXendo/nvim-material-icon",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
      },
      keys = {
      { '<leader>e',     ':Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
      { '<leader><tab>', ':Neotree toggle right<CR>', silent = true, desc = 'Left File Explorer' },
    },
      config = function()
        require("neo-tree").setup {
        popup_border_style = 'rounded',
        sort_case_insensitive = true,
        hide_root_node = true,
        default_component_configs = {
          indent = {
            with_markers = true,
            with_expanders = false,
          },
          icon = {
            folder_closed = ' ',
            folder_open = ' ',
            folder_empty = ' ',
            folder_empty_open = ' ',
          },
          git_status = {
            symbols = {
              added = '',
              deleted = '',
              modified = '󰏫',
              renamed = '󰓡',
              untracked = '',
              ignored = ' ',
              unstaged = '',
              staged = '',
              conflict = '',
            },
          },
        },
        window = {
          position = 'float',
          width = 35,
          popup = {
            size = { width = '65', height = '60%' },
            position = '50%',
          },
        },
        filesystem = {
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = false,
          },
        },
      }
      end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local config = require("plugins.lualine.config")
      require("lualine").setup(config)
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    'akinsho/bufferline.nvim',
    event = 'BufEnter',
    config = function()
      require("plugins.editor.bufferline")
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    dependences = {},
    config = function()
      require('which-key').setup({
        preset = "modern",
        plugins = {
          presets = {
            operators = false,
            motions = false,
            text_objects = true,
          }
        },
        icons = {
          rules = false,
        }
      })


      require('which-key').add({
        { "<leader>b",  group = " Buffer" },
        { "<leader>b_", hidden = true },
        { "<leader>c",  group = " Code" },
        { "<leader>c_", hidden = true },
        { "<leader>f",  group = " Format" },
        { "<leader>f_", hidden = true },
        { "<leader>l",  group = " LSP" },
        { "<leader>l_", hidden = true },
        { "<leader>r",  group = " Rename" },
        { "<leader>r_", hidden = true },
        { "<leader>s",  group = " Search" },
        { "<leader>s_", hidden = true },
        { "<leader>u",  group = " Dismissed Notifications" },
        { "<leader>u_", hidden = true },
        { "<leader>w",  group = " Workspace" },
        { "<leader>w_", hidden = true },
        { "<leader>x",  group = " Trouble" },
        { "<leader>x_", hidden = true },
      })
    end,
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({})
      require("telescope").load_extension("scope")
      vim.keymap.set("n", "<leader>tm", ":ScopeMoveBuf ", { desc = "Move buffer to tab" })
      vim.keymap.set("n", "<leader>ta", "<cmd>tabnew<CR>", { desc = "New Tab page" })
      vim.keymap.set("n", "]t", "<cmd>tabn<CR>", { desc = "Next tab" })
      vim.keymap.set("n", "[t", "<cmd>tabp<CR>", { desc = "Previous tab" })
      vim.keymap.set("n", "<leader>tC", "<cmd>tabc<CR>", { desc = "Close current tab" })
    end,
  }
}

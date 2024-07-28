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
}
}

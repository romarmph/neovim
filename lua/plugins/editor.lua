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
    'echasnovski/mini.hipatterns',
    version = '*',

    opts = function()
      local hi = require 'mini.hipatterns'
      return {
        tailwind = {
          enabled = true,
          ft = { 'typescriptreact', 'javascriptreact', 'css', 'javascript', 'typescript', 'html', 'svelte' },
          style = 'full',
        },
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color { priority = 2000 },
          shorthand = {
            pattern = '()#%x%x%x()%f[^%x%w]',
            group = function(_, _, data)
              ---@type string
              local match = data.full_match
              local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
              local hex_color = '#' .. r .. r .. g .. g .. b .. b

              return hi.compute_hex_color_group(hex_color, 'bg')
            end,
            extmark_opts = { priority = 2000 },
          },
        },
      }
    end,
  },
  {
  "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({})
      require("telescope").load_extension("scope")
      local keymap = vim.keymap

      keymap.set("n", "<leader>tm", ":ScopeMoveBuf ", { desc = "Move buffer to tab" })
      keymap.set("n", "<leader>ta", "<cmd>tabnew<CR>", { desc = "New Tab page" })
      keymap.set("n", "]t", "<cmd>tabn<CR>", { desc = "Next tab" })
      keymap.set("n", "[t", "<cmd>tabp<CR>", { desc = "Previous tab" })
      keymap.set("n", "<leader>tC", "<cmd>tabc<CR>", { desc = "Close current tab" })
    end,
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
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    opts = {
      draw = {
        delay = 100,
        priority = 2,
      },
      symbol = "╎",
      options = { try_as_border = true },
    },
    config = function()
      local indenscope = require('mini.indentscope')

      indenscope.setup({
        draw = {
          animation = indenscope.gen_animation.cubic({
            easing = "in-out",
            duration = 100,
            unit = 'total'
          }),
        }
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "alpha",
          "dashboard",
          "fzf",
          "help",
          "lazy",
          "lazyterm",
          "mason",
          "neo-tree",
          "notify",
          "toggleterm",
          "Trouble",
          "trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        notification = {
          window = {
            winblend = 0,
            relative = "editor",
          },
        }
      })
    end
  },
  {
    'b0o/incline.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    event = 'BufReadPre',
    priority = 1200,
    config = function()
      local colors = require('plugins.theme.colors')
      require('incline').setup {
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.bg, guifg = colors.cyan },
            InclineNormalNC = { guifg = colors.fg_dark, guibg = colors.bg },
          },
        },
        window = { margin = { vertical = 1, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if vim.bo[props.buf].modified then
            filename = ' ' .. filename
          end

          local icon, color = require('nvim-web-devicons').get_icon_color(filename)
          return { { icon, guifg = color }, { ' ' }, { filename } }
        end,
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cmdline = {
        view = 'cmdline',
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
        {
          filter = {
            event = 'notify',
            find = 'No information available',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    keys = {
      {
        '<leader>un',
        function()
          require('noice').cmd 'dismiss'
        end,
        desc = 'Dismiss All',
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
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
    end
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'

      require('rainbow-delimiters.setup').setup {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          html = rainbow_delimiters.strategy['local'],
          svelte = rainbow_delimiters.strategy['local'],
          react = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
      }
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufReadPre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true
    }
  },
  {
    'folke/trouble.nvim',
    event = "BufReadPre",
    branch = 'main',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Trouble: Open Diagnostics',
      },
      {
        '<leader>xb',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Trouble: Open Buffer Diagnostics',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Trouble: Open Symbols',
      },
      {
        '<leader>xL',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'Trouble: LSP Definitions / references / ... ',
      },
      {
        '<leader>xl',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Trouble: Location List',
      },
      {
        '<leader>xq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Trouble: Quickfix List ',
      },
      {
        '<leader>xt',
        '<cmd>TodoTrouble<CR>',
        desc = 'Trouble: Todos'
      }
    },
    opts = {},
  },
  {
    'goolord/alpha-nvim',
    dependencies = {
      'DaikyXendo/nvim-material-icon'
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      local logo = {
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮]],
        [[│││├┤ │ │╰┐┌╯││││]],
        [[╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
      }
      dashboard.section.header.val = logo
      dashboard.section.header.opts.hl = '@variable'

      dashboard.section.buttons.val = {
        dashboard.button('e', '  File Explorer', ':Neotree<CR>'),
        dashboard.button('f', '  Find File', ':Telescope find_files<CR>'),
        dashboard.button('w', '󰩉  Find Word', ':Telescope live_grep<CR>'),
        dashboard.button('q', '󰅗  Quit', ':qa<cr>'),
      }

      alpha.setup(dashboard.opts)

      vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup({
        input = {
          override = function(conf)
            conf.col = -1
            conf.row = 0
            return conf
          end,
        },
      })
    end
  }
}

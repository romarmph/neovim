return {
  {
    "windwp/nvim-ts-autotag",
    event = { "InsertEnter" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        }
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true,
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  },
  {
    "andymass/vim-matchup",
    event = "BufEnter",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
   {
    "ThePrimeagen/refactoring.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts)
      require("refactoring").setup(opts)
    end,
  },
  {
    'echasnovski/mini.hipatterns',
    event = "BufEnter",
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
    "kylechui/nvim-surround",
    event = "BufEnter",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
}

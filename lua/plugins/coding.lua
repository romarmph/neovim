return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n" },           function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
    opts = {},
  },
  {
    "ThePrimeagen/refactoring.nvim",
    event = "BufReadPre",
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

              return MiniHipatterns.compute_hex_color_group(hex_color, 'bg')
            end,
            extmark_opts = { priority = 2000 },
          },
        },
      }
    end,
  },
  {
    'github/copilot.vim',
    event = "BufReadPre",
  },
  {
    'windwp/nvim-autopairs',
    event = "BufReadPre",
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = "BufReadPre",
    ft = { 'html', 'svelte', 'markdown', 'react', 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
  {
    'mg979/vim-visual-multi',
    event = "BufReadPre",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufReadPre",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPre",
  }
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function(_)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'json',
          'jsonc',
          'python',
          'vim',
          'vimdoc',
          'yaml',
          'toml',
          'html',
          'lua',
          'css',
          'fish',
          'javascript',
          'typescript',
          'svelte',
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        matchup = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs",
          },
        }
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v',
              ['@function.outer'] = 'V',
              ['@class.outer'] = '<c-v>',
            },
            include_surrounding_whitespace = true,
          },
        },
      })
    end
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({})
      require("telescope").load_extension("scope")
      local keymap = vim.keymap
      keymap.set("n", "<leader>tm", ":ScopeMoveBuf ", { desc = "Move buffer to tab" })
      keymap.set("n", "]t", "<cmd>tabn<CR>", { desc = "Next tab" })
      keymap.set("n", "[t", "<cmd>tabp<CR>", { desc = "Previous tab" })
      keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
      keymap.set("n", "<leader>tC", "<cmd>tabc<CR>", { desc = "Close current tab" })
      keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
    end,
  }
}

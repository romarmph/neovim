return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "svelte",
          "cssls",
          "tailwindcss",
        }
      })
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function ()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "eslint-lsp",
          "prettier",
          "stylua",
        }
      })
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "lazy.nvim",
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
}

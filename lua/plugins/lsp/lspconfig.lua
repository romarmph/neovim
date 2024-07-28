return {
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {"antosha417/nvim-lsp-file-operations"},
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap
      
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }

          opts.desc = "Show Hover Docs"
          keymap.set('n', 'K', vim.lsp.buf.hover, opts )

          opts.desc = "Go to Definition"
          keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

          opts.desc = "Open Code Actions"
          keymap.set({'n', 'v',},"<leader>ca", vim.lsp.buf.code_action, opts)
        end
      })

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities
          })
        end
      })
    end
  },
}

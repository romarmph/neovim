return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap

      vim.api.nvim_create_autocmd("LspAttach", {
        vim.diagnostic.config({
          update_in_insert = true,
        }),
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }

          opts.desc = "Rename Symbol"
          -- keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

          opts.desc = "Show Hover Docs"
          keymap.set('n', 'K', vim.lsp.buf.hover, opts)

          opts.desc = "Go to Definition"
          keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

          opts.desc = "Open Code Actions"
          keymap.set({ 'n', 'v', }, "<leader>ca", vim.lsp.buf.code_action, opts)

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end
      })

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " "
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

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

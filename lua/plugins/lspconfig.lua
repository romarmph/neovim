return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'folke/neodev.nvim', opts = {} },
  },
  opts = {
    lsp_doc_border = true,
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      vim.diagnostic.config {
        update_in_insert = true,
      },
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local telescope = require("telescope.builtin");
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', telescope.lsp_definitions, 'Go to Definition')
        map('gr', telescope.lsp_definitions, 'Go to References ')
        map('gI', telescope.lsp_definitions, 'Go to Implementation')
        map('<leader>D', telescope.lsp_definitions, 'Type Definition')
        map('<leader>ds', telescope.lsp_document_symbols, 'Document Symbols')
        map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        vim.keymap.set({ 'n', 'v', }, '<leader>ca', vim.lsp.buf.code_action,
          { buffer = event.buf, desc = 'LSP: Code Actions' })
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        map('gD', vim.lsp.buf.declaration, 'Go to Declaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end
    })


    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      tsserver = {},
      svelte = {},
      jsonls = {},
      html = {},
      tailwindcss = {},
      cssls = {},
      cssmodules_ls = {},
      taplo = {},
      yamlls = {},
      sqlls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    require("mason").setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'tsserver'
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end
}

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mxsdev/nvim-dap-vscode-js",
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
      "mxsdev/nvim-dap-vscode-js"
    },
    config = function()
      require('mason-nvim-dap').setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          'delve',
          "js@v1.76.1",
        },
      }

      require("plugins.dap.keymaps")
      require("plugins.dap.dapui")
      require("plugins.dap.debuggers")
    end
  }
}

return {
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
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Trouble: Open Buffer Diagnostics',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Trouble: Open Symbols',
      },
      {
        '<leader>xl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'Trouble: LSP Definitions / references / ... ',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Trouble: Location List',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Trouble: Quickfix List ',
      },
    },
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mxsdev/nvim-dap-vscode-js",
      'jay-babu/mason-nvim-dap.nvim',

      -- Debuggers
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

      local dap = require("dap")
      local keymap = vim.keymap
      keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" });
      keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" });
      keymap.set("n", "<leader>d[", dap.step_into, { desc = "Step into" });
      keymap.set("n", "<leader>d]", dap.step_over, { desc = "Step over" });
      keymap.set("n", "<leader>do", dap.step_over, { desc = "Step out" });

      local dapui = require('dapui')
      ---@diagnostic disable-next-line: missing-fields
      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        ---@diagnostic disable-next-line: missing-fields
        controls = {
          ---@diagnostic disable-next-line: missing-fields
          icons = {
            pause = '',
            play = '',
            step_into = '',
            step_over = '',
            step_out = '',
            step_back = '',
            run_last = '',
            terminate = ' ',
            disconnect = '',
          },
        },
      }
      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require("plugins.debugging.debuggers")
    end
  }
}

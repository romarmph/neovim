local dap = require("dap")
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" });
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" });
vim.keymap.set("n", "<leader>d[", dap.step_into, { desc = "Step into" });
vim.keymap.set("n", "<leader>d]", dap.step_over, { desc = "Step over" });
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step out" });

local chat = require("CopilotChat")
vim.keymap.set("n", "<leader>cc", function() chat.open() end, { desc = "Open Copilot Chat" })
vim.keymap.set(
  { "n", "v" },
  "<leader>cp",
  function()
    local actions = require("CopilotChat.actions")
    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions(), { previewer = false })
  end,
  { desc = "CopilotChat - Prompt actions" })

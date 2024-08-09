local languages = {
  "typescript",
  "javascript",
  "svelte",
}

---@diagnostic disable-next-line: missing-fields
require('dap-vscode-js').setup({
  debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
  debugger_cmd = { 'js-debug-adapter' },
  adapters = { 'pwa-node', 'pwa-chrome', 'node-terminal', 'pwa-extensionHost' },
})

for _, language in ipairs(languages) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "attach",
      processId = require 'dap.utils'.pick_process,
      name = "Attach debugger to existing `node --inspect` process",
      sourceMaps = true,
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**" },
      cwd = "${workspaceFolder}/src",
      skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
    },
    {
      type = "pwa-chrome",
      name = "Launch Chrome to debug client",
      request = "launch",
      url = "http://localhost:5173",
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}/src",
      skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
    },
    language == "javascript" and {
      type = "pwa-node",
      request = "launch",
      name = "Launch file in new node process",
      program = "${file}",
      cwd = "${workspaceFolder}",
    } or nil,
  }
end

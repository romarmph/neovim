local M = {}

M.servers = {
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

return M

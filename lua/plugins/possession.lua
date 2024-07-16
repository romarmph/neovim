return {
  'jedrzejboczar/possession.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require("possession").setup({
      session_dir = vim.fn.stdpath('data') .. '/possession',
      silent = false,
      load_silent = true,
      hooks = {
        after_save = function(name, user_data, aborted)
          vim.cmd [[ScopeSaveState]]
        end,
        before_load = function(name, user_data)
          vim.cmd [[ScopeLoadState]]
          return user_data
        end,
      },
      telescope = {
        previewer = {
          enabled = false,
          previewer = 'pretty',   -- or 'raw' or fun(opts): Previewer
          wrap_lines = true,
        },
        list = {
          default_action = 'load',
          mappings = {
            save = { n = '<c-x>', i = '<c-x>' },
            load = { n = '<c-v>', i = '<c-v>' },
            delete = { n = '<c-t>', i = '<c-t>' },
            rename = { n = '<c-r>', i = '<c-r>' },
          },
        },
      },
    })
    require('telescope').load_extension('possession')
    require("plugins.possession.keymaps")
  end
}

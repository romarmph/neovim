return {
  'windwp/nvim-ts-autotag',
  ft = { 'html', 'svelte', 'markdown' },
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-ts-autotag').setup {
      -- did_setup = true,
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
      -- Also override individual filetype configs, these take priority.
      -- Empty by default, useful if one of the "opts" global settings
      -- doesn't work well in a specific filetype
      -- per_filetype = {
      --   ['html'] = {
      --     enable_close = false,
      --   },
      -- },
    }
  end,
}

return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'

    require('rainbow-delimiters.setup').setup {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        html = rainbow_delimiters.strategy['local'],
        svelte = rainbow_delimiters.strategy['local'],
        react = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
    }
  end,
}

return {
  'goolord/alpha-nvim',
  requires = {
    'DaikyXendo/nvim-material-icon'
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    local logo = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮]],
      [[│││├┤ │ │╰┐┌╯││││]],
      [[╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
    }

    dashboard.section.header.val = logo
    dashboard.section.header.opts.hl = '@variable'

    local neotree = require("neo-tree")


    dashboard.section.buttons.val = {
      dashboard.button('e', '  File Explorer', ':Neotree<CR>'),
      dashboard.button('f', '  Find File', ':Telescope find_files<CR>'),
      dashboard.button('w', '󰩉  Find Word', ':Telescope live_grep<CR>'),
      dashboard.button('q', '󰅗  Quit', ':qa<cr>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]
  end,
}

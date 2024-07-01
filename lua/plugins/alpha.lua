return {
  'goolord/alpha-nvim',
  requires = { 'DaikyXendo/nvim-material-icon' },
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

    dashboard.section.buttons.val = {
      dashboard.button('Leader e ', '  File Explorer'),
      dashboard.button('Leader sf', '  Find File'),
      dashboard.button('Leader sg', '󰩉  Find Word'),
      dashboard.button('q', '󰅗  Quit', ':qa<cr>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]
  end,
}

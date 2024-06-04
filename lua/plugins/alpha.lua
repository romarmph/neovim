return {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
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
      dashboard.button('<LD> e  ', '  File Explorer'),
      dashboard.button('<LD> s f', '  Find File'),
      dashboard.button('<LD> s g', '󰩉  Find Word'),
      dashboard.button('q', '󰅗  Quit', ':qa<cr>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]
  end,
}

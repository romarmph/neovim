return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    style = 'night',
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight-night'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
    vim.cmd.hi 'TelescopeBorder guifg=#1f2533'
    vim.cmd.hi 'TelescopePromptBorder guifg=#1f2533'
    vim.cmd.hi 'TelescopePromptTitle guifg=#7982a9'
    vim.cmd.hi 'TelescopeResultsTitle guifg=#7982a9'
    -- vim.cmd.hi 'NeoTreeIndentMarker guifg=#10131a'
    vim.cmd.hi 'DiagnosticUnnecessary guifg=#8289B3'
    vim.cmd.hi 'CursorLine guibg=NONE'
    vim.cmd.hi 'WinSeparator guifg=#363b4a'
  end,
}

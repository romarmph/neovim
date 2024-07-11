return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').register {
      ['<leader>x'] = { name = ' Trouble', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = ' Rename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = ' Search', _ = 'which_key_ignore' },
      ['<leader>c'] = { name = ' Code', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = ' Workspace', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = ' Format', _ = 'which_key_ignore' },
      ['<leader>u'] = { name = ' Dismissed Notifications', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = ' Buffer', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = ' LSP', _ = 'which_key_ignore' },
    }
  end,
}

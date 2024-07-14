return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').add({
      { "<leader>b",  group = " Buffer" },
      { "<leader>b_", hidden = true },
      { "<leader>c",  group = " Code" },
      { "<leader>c_", hidden = true },
      { "<leader>f",  group = " Format" },
      { "<leader>f_", hidden = true },
      { "<leader>l",  group = " LSP" },
      { "<leader>l_", hidden = true },
      { "<leader>r",  group = " Rename" },
      { "<leader>r_", hidden = true },
      { "<leader>s",  group = " Search" },
      { "<leader>s_", hidden = true },
      { "<leader>u",  group = " Dismissed Notifications" },
      { "<leader>u_", hidden = true },
      { "<leader>w",  group = " Workspace" },
      { "<leader>w_", hidden = true },
      { "<leader>x",  group = " Trouble" },
      { "<leader>x_", hidden = true },
    })
  end,
}

return {
  'andymass/vim-matchup',
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    vim.g.matmatchup_matchparen_enabled = 1
  end,
}

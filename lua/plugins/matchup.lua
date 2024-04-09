return {
  'andymass/vim-matchup',
  config = function()
    -- may set any options here
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    vim.g.matmatchup_matchparen_enabled = 1
  end,
}

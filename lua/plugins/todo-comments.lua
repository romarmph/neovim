return {
  'folke/todo-comments.nvim',
  event = 'BufReadPre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true
  }
}

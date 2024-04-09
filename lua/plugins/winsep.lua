return {
  'nvim-zh/colorful-winsep.nvim',
  config = true,
  event = { 'WinNew' },
  opts = {
    smooth = false,
    hi = {
      bg = 'NONE',
      fg = '#2a4878',
    },
    no_exec_files = { 'packer', 'TelescopePrompt', 'mason', 'CompetiTest', 'NvimTree', 'Neotree' },
  },
}

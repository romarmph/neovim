local opt = vim.opt
local g = vim.g

g.netrw_liststyle = 3
g.have_nerd_font = false
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.showmode = true
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.breakindent = true
opt.clipboard = 'unnamedplus'
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.list = true
opt.listchars = { tab = '  ', trail = '.', nbsp = '␣' }
opt.inccommand = 'split'
opt.scrolloff = 10
opt.hlsearch = true
opt.laststatus = 3
opt.fillchars = { eob = ' ' }
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.showtabline = 2

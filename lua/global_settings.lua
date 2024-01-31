-- global settings
vim.g.mapleader = ","
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.hlsearch = true
opt.incsearch = true
opt.updatetime = 100
opt.cursorline = line
opt.showmode = false
opt.shiftwidth = 2
opt.smartindent = true
vim.cmd('colorscheme gruvbox')

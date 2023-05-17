vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local opt = vim.opt

opt.encoding = "UTF-8"

opt.smartcase = true
opt.smartindent = true

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.cursorline = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true

opt.number = true
opt.relativenumber = true

opt.undofile = true
opt.undolevels = 10000

opt.splitkeep = "screen"
opt.termguicolors = true

opt.shortmess:append({ W = true,I = true, c = true, C = true})
opt.updatetime = 200

opt.laststatus = 0
opt.list = true

opt.conceallevel = 2 -- Markdown Hiding

opt.cc = "80"
vim.g.markdown_recommended_style = 0

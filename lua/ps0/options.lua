vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
-- vim.opt.shortness:append "c"




vim.cmd([[
    filetype on
    filetype plugin indent on
    set iskeyword+=-
    syntax on
]])


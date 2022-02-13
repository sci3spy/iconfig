-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.lazyredraw = true
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.pumheight = 10
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.wildignore:append { "*.pyc", "**/.git/*" }
vim.opt.path:append "**"
vim.opt.shortmess:append "c"
vim.opt.completeopt = { "menu", "menuone", "noselect" }


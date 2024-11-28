-- Line numbers 
vim.opt.nu = true;
vim.opt.relativenumber = true;

-- Tabs and shift 
vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;
vim.opt.smartindent = true;

-- Line wrap 
vim.opt.wrap = true;

-- Search
vim.opt.hlsearch = false;
vim.opt.incsearch = true;

-- Colors
vim.opt.termguicolors = true;

-- How many lines are always at the bottom
vim.opt.scrolloff = 8;
vim.opt.signcolumn = "yes";
vim.opt.isfname:append("@-@");

vim.opt.updatetime = 50;
vim.opt.colorcolumn = "80";


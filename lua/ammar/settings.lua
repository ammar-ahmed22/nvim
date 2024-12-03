-- Enables faster loading
vim.loader.enable()
-- Leader
vim.g.mapleader = " ";

-- Disabling netrw for nvim-tree 
vim.g.loaded_netrw = 1;
vim.g.loaded_netrwPlugin = 1;

-- Nerd Font
vim.g.have_nerd_font = true;

-- Mouse mode enabled
vim.opt.mouse = "a";

-- Sync Neovim and OS clipboard
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus";
end)

-- Line numbers
vim.opt.nu = true;
vim.opt.relativenumber = true;

-- Tabs and shift
vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;
vim.opt.smartindent = true;
vim.opt.breakindent = true;

-- Line wrap
vim.opt.wrap = true;

-- Save undo history
vim.opt.undofile = true;

-- Search
vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')
vim.opt.incsearch = true;
vim.opt.ignorecase = true;
vim.opt.smartcase = true;

-- Colors
vim.opt.termguicolors = true;

-- How many lines are always at the bottom
vim.opt.scrolloff = 10;
vim.opt.signcolumn = "yes";
vim.opt.isfname:append("@-@");

-- Update time before plugins are updated
vim.opt.updatetime = 50;

-- Color the 80th column
vim.opt.signcolumn = 'yes';

-- Timeout for mapped sequences
vim.opt.timeoutlen = 100;


-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show line your cursor is on
vim.opt.cursorline = true

-- whitespace chars
vim.opt.list = true;
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = "split"

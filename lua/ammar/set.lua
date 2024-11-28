vim.g.mapleader = " ";
vim.keymap.set("n", "<leader>h", vim.cmd.Ex);

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
-- vim.opt.hlsearch = false;
vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')
vim.opt.incsearch = true;
vim.opt.ignorecase = true;
vim.opt.smartcase = true;

-- Colors
vim.opt.termguicolors = true;

-- How many lines are always at the bottom
vim.opt.scrolloff = 8;
vim.opt.signcolumn = "yes";
vim.opt.isfname:append("@-@");

-- Update time before plugins are updated 
vim.opt.updatetime = 50;

-- Color the 80th column
vim.opt.colorcolumn = "80";
vim.opt.signcolumn = 'yes';

-- Timeout for mapped sequences
vim.opt.timeoutlen = 300;


-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show line your cursor is on 
vim.opt.cursorline = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- Custom command for git add and commit
vim.keymap.set("n", "<leader>gac", function ()
    local commit_msg = vim.fn.input("message > ");
    if commit_msg ~= "" then
        vim.cmd("!git add . && git commit -m \"" .. commit_msg .. "\"")
    else
        print("Commit aborted: No message provided.")
    end
end, { noremap = true, desc = "Git add and commit with message prompt"})


-- Custom command for git push 
vim.keymap.set("n", "<leader>gp", function ()
    vim.cmd("!git push")

end, { noremap = true, desc = "Git push"})

vim.opt.textwidth = 80;

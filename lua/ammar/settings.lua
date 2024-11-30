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
-- vim.opt.relativenumber = true;

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
vim.opt.timeoutlen = 300;


-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show line your cursor is on
vim.opt.cursorline = true

-- Highlight when copying text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Saves file if it is modified 
local function save_if_modified()
    if vim.bo.modified and vim.bo.buftype == "" and vim.bo.buftype ~= "TelescopePrompt" then
        vim.cmd("write")
    end
end

-- Autosave if file is modified in normal or visual mode 
vim.api.nvim_create_autocmd("TextChanged", {
    pattern = "*",
    callback = save_if_modified
})

-- Autosave after insert mode is left (if the file is changed)
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = save_if_modified
})


-- Custom command functions for running stuff in the terminal 

-- Used with :R/:Run 
-- If no argument provided, tries to use saved command 
function HandleRun(args)
    -- No argument but there is saved command 
    if args.args == "" and vim.g.run_command then
        -- Confirm, maybe it was an accident? 
        local confirm = vim.fn.confirm("Do you want to run `" .. vim.g.run_command .. "`?", "&Yes\n&No", 1)
        if confirm == 1 then
            vim.cmd("!" .. vim.g.run_command)
        end
        return
    end
    -- Give preference to passed argument
    local command = args.args ~= "" and args.args or vim.g.run_command
    if command == nil or command == "" then
        print("No command to run. Set command with :SetRun <CMD>.")
        return 
    end
    vim.cmd("!" .. command)
end

-- Used with :SR/:SetRun 
function HandleSetRun(args)
    vim.g.run_command = args.args
    print("Run command set to: `" .. args.args .. "`")
end

-- Used with :GR/GetRun 
function HandleGetRun()
   local cmd = vim.g.run_command
   if cmd ~= nil then
       print("Run command: `" .. cmd .. "`")
   else
       print("No command set. Set command with :SetRun <CMD>")
   end
end

vim.api.nvim_create_user_command("R", HandleRun, { nargs = "?" })
vim.api.nvim_create_user_command("Run", HandleRun, { nargs = "?" })
vim.api.nvim_create_user_command("SetRun", HandleSetRun, { nargs = 1 })
vim.api.nvim_create_user_command("SR", HandleSetRun, { nargs = 1 })
vim.api.nvim_create_user_command("GetRun", HandleGetRun, { nargs = 0 })
vim.api.nvim_create_user_command("GR", HandleGetRun, { nargs = 0 })
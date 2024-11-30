-- Open and focus the file tree 
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", { desc = "[F]ile tree", silent = true })
-- Quit window 
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "[Q]uit the focused window", silent = true })

-- Escape in normal mode to remove search higlight
vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')

-- Git add 
vim.keymap.set("n", "<leader>ga", function ()
    local path = vim.fn.input("Provide a path to git add [.]: ")
    local add_path = path ~= "" and path or "."
    vim.cmd("!git add " .. add_path)
end, { noremap = true, desc = "Git [A]dd"})

-- Git commit 
vim.keymap.set("n", "<leader>gc", function ()
    local commit_msg = vim.fn.input("Provide a commit message: ")
    if commit_msg ~= "" then
        vim.cmd("!git commit -m \"" .. commit_msg .. "\"")
    else
        print("Commit aborted: No message provided.")
    end
end, { noremap = true, desc = "Git [C]ommit"})

-- Git push
vim.keymap.set("n", "<leader>gp", function()
    vim.cmd("!git push")
end, { noremap = true, desc = "Git [P]ush" })

-- Git status 
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git [S]tatus"})

-- Window navigation
vim.keymap.set('n', '<leader>w', '<C-w>w', { desc = "Switch [W]indow (R-L)" })
vim.keymap.set('n', '<leader>W', '<C-w>W', { desc = "Switch [W]indow (L-R)"})
vim.keymap.set('n', '<leader>r', '<C-w>l', { desc = "Switch to the right window" })
vim.keymap.set('n', '<leader>e', '<C-w>h', { desc = "Switch to the left window" })

-- New vertical window (that's the one I'll be using exclusively)
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = "New [V]ertical Window" })


-- Page up and down center cursor 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--


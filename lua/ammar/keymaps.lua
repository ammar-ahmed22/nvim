-- Open and focus the file tree 
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", { desc = "[F]ile tree", silent = true })
-- Quit window 
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "[Q]uit the focused window", silent = true })

-- Escape in normal mode to remove search higlight
vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')

-- -- Git add and commit
-- vim.keymap.set("n", "<leader>gac", function()
--     local commit_msg = vim.fn.input("Provide a commit message: ");
--     if commit_msg ~= "" then
--         vim.cmd("!git add . && git commit -m \"" .. commit_msg .. "\"")
--     else
--         print("Commit aborted: No message provided.")
--     end
-- end, { noremap = true, desc = "[G]it [A]dd and [C]ommit with message prompt" })

-- Git add 
vim.keymap.set("n", "<leader>ga", function ()
    local path = vim.fn.input("Provide a path to git add [.]: ")
    local add_path = path ~= "" and path or "."
    vim.cmd("!git add " .. add_path)
end, { noremap = true, desc = "[G]it [A]dd"})

-- Git commit 
vim.keymap.set("n", "<leader>gc", function ()
    local commit_msg = vim.fn.input("Provide a commit message: ")
    if commit_msg ~= "" then
        vim.cmd("!git commit -m \"" .. commit_msg .. "\"")
    else
        print("Commit aborted: No message provided.")
    end
end, { noremap = true, desc = "[G]it [C]ommit"})

-- Git push
vim.keymap.set("n", "<leader>gp", function()
    vim.cmd("!git push")
end, { noremap = true, desc = "Git push" })

-- Git status 
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)



-- Window navigation
vim.keymap.set('n', '<leader>w', '<C-w>w', { desc = "Switch [W]indow" })

-- New vertical window (that's the one I'll be using exclusively)
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = "New [V]ertical Window" })

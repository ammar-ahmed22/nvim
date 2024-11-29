vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", { desc = "[F]ile tree", silent = true })
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "[Q]uit the focused window", silent = true })


vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')

-- Custom command for git add and commit
vim.keymap.set("n", "<leader>gac", function()
    local commit_msg = vim.fn.input("message: ");
    if commit_msg ~= "" then
        vim.cmd("!git add . && git commit -m \"" .. commit_msg .. "\"")
    else
        print("Commit aborted: No message provided.")
    end
end, { noremap = true, desc = "Git add and commit with message prompt" })

-- Custom command for git push
vim.keymap.set("n", "<leader>gp", function()
    vim.cmd("!git push")
end, { noremap = true, desc = "Git push" })

-- Window navigation remapped to WASD
vim.keymap.set('n', '<leader>w', '<C-w>w', { desc = "Switch [W]indow" })

-- New vertical window (that's the one I'll be using exclusively)
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = "New [V]ertical Window" })

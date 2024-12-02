-- Open and focus the file tree 
vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Toggle [F]ile tree", silent = true })
-- Quit window 
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "[Q]uit the focused window", silent = true })

-- Escape in normal mode to remove search higlight
vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')

-- Git add and commit 
vim.keymap.set("n", "<leader>gac", ":AddCommit<CR>", { desc = "[G]it [A]dd and [C]ommit"})


-- Git push
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, desc = "Git [P]ush" })

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

-- Closing terminal in insert mode 
vim.keymap.set('t', "<Esc>", '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })
vim.keymap.set('t', "<C-\\>", '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })

-- Opening terminal session in horizontal split window 
vim.keymap.set('n', '<leader>t', function ()
    vim.cmd("split | terminal")
end, { noremap = true, silent = true, desc = "Start [T]erminal"})


-- ChatGPT plugin keybinding 
vim.keymap.set('n', "<leader>cc", ":ChatGPT<CR>", { noremap = true, silent = true, desc = "Open [C]hatGPT [C]hat"})

-- Alpha as home 
vim.keymap.set('n', "<leader>h", ":Alpha<CR>", { noremap = true, silent = true, desc = "Return to [H]ome screen"})

-- Newline under current line in normal mode 
vim.keymap.set('n', "<leader>nl", "o<C-c>", { noremap = true, silent = true, desc = "[N]ew [L]ine under current"})


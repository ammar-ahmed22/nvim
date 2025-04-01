-- Open and focus the file tree
vim.keymap.set("n", "<leader>t", ":Neotree focus toggle<CR>", { desc = "Toggle [F]ile tree", silent = true })
-- Quit window
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "[Q]uit the focused window", silent = true })

-- Save buffer
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "[S]ave the current buffer", silent = true, noremap = true })

-- Escape in normal mode to remove search higlight
vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')

-- Git add and commit
-- vim.keymap.set("n", "<leader>gac", ":AddCommit<CR>", { desc = "[G]it [A]dd and [C]ommit" })

-- Git commit (prompts for input)
vim.keymap.set("n", "<leader>gc", ":Commit<CR>", { desc = "[G]it [C]ommit" })

-- Git add current file
vim.keymap.set("n", "<leader>ga", ":Git add %<CR>", { desc = "[G]it [A]dd current file"})

-- Git restore current file
vim.keymap.set("n", "<leader>gr", ":Git restore %<CR>", { desc = "[G]it [R]estore current file"})

-- Git unstage current file
vim.keymap.set("n", "<leader>gus", ":Git restore --staged %<CR>-animation", { desc = "[G]it [U]n[S]tage current file" })

-- Git push
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, desc = "Git [P]ush" })

-- Git status
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git [S]tatus" })

-- Git diff split
vim.keymap.set("n", "<leader>gds", vim.cmd.Gdiffsplit, { desc = "[G]it [D]iff [S]plit" })

-- Git branch
vim.keymap.set("n", "<leader>gb", ":Git branch <CR>", { desc = "Git [B]ranch" })

-- Window navigation
vim.keymap.set('n', '<leader>W', '<C-w>W', { desc = "Switch [W]indow (L-R)" })
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
-- Just use a terminal cro
-- vim.keymap.set('n', '<leader>t', function()
--     vim.cmd("split | terminal")
-- end, { noremap = true, silent = true, desc = "Start [T]erminal" })


-- ChatGPT plugin keybinding
vim.keymap.set('n', "<leader>cc", ":ChatGPT<CR>", { noremap = true, silent = true, desc = "Open [C]hatGPT [C]hat" })

-- Alpha as home
vim.keymap.set('n', "<leader>h", ":Alpha<CR>", { noremap = true, silent = true, desc = "Return to [H]ome screen" })

-- Newline under current line in normal mode
vim.keymap.set('n', "<leader>nl", "o<C-c>", { noremap = true, silent = true, desc = "[N]ew [L]ine under current" })

vim.keymap.set('n', "gfr", ":%s/", { noremap = true, desc = "[F]ind and replace in file." })
vim.keymap.set('n', 'gff', "/", { noremap = true, desc = "[F]ind in file." })

vim.keymap.set('n', '<leader>gf', function()
    vim.lsp.buf.format({ timeout_ms = 10000 })
end, { desc = "[F]ormat the current buffer" })


-- Search for selected text in visual mode
vim.keymap.set('v', '/', "\"fy/\\V<C-R>f<CR>", { desc = "Search for the selected text" })

-- Close the currently open tab
vim.keymap.set('n', '<leader>w', '<Cmd>BufferClose<CR>', { desc = "Close the current buffer", noremap = true, silent = true })
-- Close all but the current tab
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = "Close all [O]ther [B]uffers", noremap = true, silent = true })
-- -- Close tabs to the right
vim.keymap.set('n', '<leader>br', '<Cmd>BufferCloseBuffersRight<CR>', { desc = "Close [B]uffers to the [R]ight", noremap = true, silent = true })
-- -- Close tabs to the left
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferCloseBuffersLeft<CR>', { desc = "Close [B]uffers to the [L]eft", noremap = true, silent = true })
-- Navigate to the next tab
vim.keymap.set('n', ']t', '<Cmd>BufferNext<CR>', { desc = "Navigate to the next [T]ab", noremap = true, silent = true })
-- Navigate to the previous tab
vim.keymap.set('n', '[t', '<Cmd>BufferPrevious<CR>', { desc = "Navigate to the previous [T]ab", noremap = true, silent = true })
-- Magic tab picker
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPick<CR>', { desc = "[B]uffer [P]ick", noremap = true, silent = true })

-- Go to buffer specified by number
vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { desc = "Go to buffer 1", noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { desc = "Go to buffer 2", noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { desc = "Go to buffer 3", noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { desc = "Go to buffer 4", noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { desc = "Go to buffer 5", noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', { desc = "Go to buffer 6", noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', { desc = "Go to buffer 7", noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', { desc = "Go to buffer 8", noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', { desc = "Go to buffer 9", noremap = true, silent = true })

vim.keymap.set("n", "<leader>fs", "<cmd>lua require('flash').jump()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ft", "<cmd>lua require('flash').treesitter()<CR>", { noremap = true })

-- Multi-cursor
vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)", { noremap = false })
vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)", { noremap = false })

-- Print working file
vim.keymap.set("n", "<leader>pw", ":echo expand('%:p')<CR>", { noremap = true, desc = "Print the working file" })

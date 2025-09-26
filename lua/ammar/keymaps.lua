-- Converted to commander-managed keymaps
local commander = require("commander")

commander.add({
  -- File Tree
  { desc = "Toggle File tree", cmd = ":Neotree focus toggle<CR>", keys = { "n", "<leader>t", { silent = true } }, cat = "File Tree" },

  -- Windows
  { desc = "Quit the focused window", cmd = "<C-w>q", keys = { "n", "<leader>q", { silent = true } }, cat = "Window" },
  { desc = "New Vertical Window", cmd = ":vsplit<CR>", keys = { "n", "<leader>v" }, cat = "Window" },
  { desc = "Switch Window (L-R)", cmd = "<C-w>W", keys = { "n", "]w" }, cat = "Window" },
  { desc = "Switch Window (R-L)", cmd = "<C-w>w", keys = { "n", "[w" }, cat = "Window" },

  -- Save
  { desc = "Save current buffer", cmd = ":w<CR>", keys = { "n", "<C-s>", { silent = true, noremap = true } }, cat = "File" },

  -- Search
  { desc = "Clear search highlight", cmd = "<cmd>nohlsearch<CR>", keys = { "n", "<Esc>" }, cat = "Search" },
  { desc = "Find and replace in file", cmd = ":%s/", keys = { "n", "gfr", { noremap = true } }, cat = "Search" },
  { desc = "Find in file", cmd = "/", keys = { "n", "gff", { noremap = true } }, cat = "Search" },
  { desc = "Search for selected text", cmd = "\"fy/\\V<C-R>f<CR>", keys = { "v", "/" }, cat = "Search" },

  -- Git (Fugitive)
  -- { desc = "Git Add and Commit", cmd = ":AddCommit<CR>", keys = { "n", "<leader>gac" }, cat = "Git" },
  { desc = "Git Commit", cmd = ":Commit<CR>", keys = { "n", "<leader>gc" }, cat = "Git" },
  { desc = "Git Add current file", cmd = ":Git add %<CR>", keys = { "n", "<leader>ga" }, cat = "Git" },
  { desc = "Git Restore current file", cmd = ":Git restore %<CR>", keys = { "n", "<leader>gr" }, cat = "Git" },
  { desc = "Git Unstage current file", cmd = ":Git restore --staged %<CR>", keys = { "n", "<leader>gus" }, cat = "Git" },
  { desc = "Git Push", cmd = ":Git push<CR>", keys = { "n", "<leader>gp", { noremap = true } }, cat = "Git" },
  { desc = "Git Status", cmd = vim.cmd.Git, keys = { "n", "<leader>gs" }, cat = "Git" },
  { desc = "Git Diff Split", cmd = vim.cmd.Gdiffsplit, keys = { "n", "<leader>gds" }, cat = "Git" },
  { desc = "Git Branch", cmd = ":Git branch <CR>", keys = { "n", "<leader>gb" }, cat = "Git" },

  -- Paging center cursor
  { desc = "Page down (center)", cmd = "<C-d>zz", keys = { "n", "<C-d>" }, cat = "Navigation" },
  { desc = "Page up (center)", cmd = "<C-u>zz", keys = { "n", "<C-u>" }, cat = "Navigation" },

  -- Terminal
  { desc = "Close terminal", cmd = '<C-\\><C-n>:q<CR>', keys = { "t", "<Esc>", { noremap = true, silent = true } }, cat = "Terminal" },
  { desc = "Close terminal", cmd = '<C-\\><C-n>:q<CR>', keys = { "t", "<C-\\>", { noremap = true, silent = true } }, cat = "Terminal" },

  -- Tools
  { desc = "Open Claude Code", cmd = ":ClaudeCode<CR>", keys = { "n", "<leader>cc", { noremap = true, silent = true } }, cat = "Tools" },
  { desc = "Home Screen", cmd = ":Alpha<CR>", keys = { "n", "<leader>h", { noremap = true, silent = true } }, cat = "Tools" },

  -- Editing
  { desc = "New line under current", cmd = "o<C-c>", keys = { "n", "<leader>nl", { noremap = true, silent = true } }, cat = "Editing" },
  { desc = "Format current buffer", cmd = function() vim.lsp.buf.format({ timeout_ms = 10000 }) end, keys = { "n", "<leader>gf" }, cat = "LSP" },

  -- Buffers (barbar)
  { desc = "Close current buffer", cmd = "<Cmd>BufferClose<CR>", keys = { "n", "<leader>w", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Close all other buffers", cmd = "<Cmd>BufferCloseAllButCurrent<CR>", keys = { "n", "<leader>bo", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Close buffers to the right", cmd = "<Cmd>BufferCloseBuffersRight<CR>", keys = { "n", "<leader>br", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Close buffers to the left", cmd = "<Cmd>BufferCloseBuffersLeft<CR>", keys = { "n", "<leader>bl", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Next buffer", cmd = "<Cmd>BufferNext<CR>", keys = { "n", "]t", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Previous buffer", cmd = "<Cmd>BufferPrevious<CR>", keys = { "n", "[t", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Buffer pick", cmd = "<Cmd>BufferPick<CR>", keys = { "n", "<leader>bp", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 1", cmd = "<Cmd>BufferGoto 1<CR>", keys = { "n", "<leader>1", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 2", cmd = "<Cmd>BufferGoto 2<CR>", keys = { "n", "<leader>2", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 3", cmd = "<Cmd>BufferGoto 3<CR>", keys = { "n", "<leader>3", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 4", cmd = "<Cmd>BufferGoto 4<CR>", keys = { "n", "<leader>4", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 5", cmd = "<Cmd>BufferGoto 5<CR>", keys = { "n", "<leader>5", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 6", cmd = "<Cmd>BufferGoto 6<CR>", keys = { "n", "<leader>6", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 7", cmd = "<Cmd>BufferGoto 7<CR>", keys = { "n", "<leader>7", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 8", cmd = "<Cmd>BufferGoto 8<CR>", keys = { "n", "<leader>8", { noremap = true, silent = true } }, cat = "Buffers" },
  { desc = "Go to buffer 9", cmd = "<Cmd>BufferGoto 9<CR>", keys = { "n", "<leader>9", { noremap = true, silent = true } }, cat = "Buffers" },

  -- Flash
  { desc = "Flash jump", cmd = function() require('flash').jump() end, keys = { "n", "<leader>fs", { noremap = true } }, cat = "Flash" },
  { desc = "Flash treesitter", cmd = function() require('flash').treesitter() end, keys = { "n", "<leader>ft", { noremap = true } }, cat = "Flash" },

  -- Multi-cursor (vim-visual-multi)
  { desc = "Add cursor down", cmd = "<Plug>(VM-Add-Cursor-Down)", keys = { "n", "<C-j>", { noremap = false } }, cat = "Multi-cursor" },
  { desc = "Add cursor up", cmd = "<Plug>(VM-Add-Cursor-Up)", keys = { "n", "<C-k>", { noremap = false } }, cat = "Multi-cursor" },

  -- Copilot
  { desc = "Disable copilot", cmd = ":Copilot disable<CR>", keys = { "n", "<leader>cd", { noremap = true, silent = true } }, cat = "Copilot" },
  { desc = "Enable copilot", cmd = ":Copilot enable<CR>", keys = { "n", "<leader>ce", { noremap = true, silent = true } }, cat = "Copilot" },
})


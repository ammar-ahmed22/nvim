local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>/', builtin.find_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "[S]earch project file contents by [W]ord"})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "[S]earch project file contents with [G]rep"})

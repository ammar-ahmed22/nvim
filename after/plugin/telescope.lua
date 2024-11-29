local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>/', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "Telescope find files with word"})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "Telescope search with grep"})

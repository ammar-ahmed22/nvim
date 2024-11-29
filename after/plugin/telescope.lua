local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-space>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Telescope find files with word"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope search with grep"})

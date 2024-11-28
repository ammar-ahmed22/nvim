local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = 'Telescope find files tracked by git' })
vim.keymap.set('n', '<leader>fw', function()
	builtin.grep_string({ search = vim.fn.input("query > ")})
end)


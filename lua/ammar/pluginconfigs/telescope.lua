require("telescope").setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
})
require("telescope").load_extension("ui-select")
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>/', function ()
  builtin.find_files({
    find_command = {
      'rg',
      '--files',
      '--hidden',
      '--glob', '!.git/*',
    }
  })
end, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "Search project file contents by [W]ord" })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "Search project file contents with [G]rep" })

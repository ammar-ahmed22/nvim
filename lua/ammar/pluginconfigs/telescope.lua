require("telescope").setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
})
require("telescope").load_extension("ui-select")
local commander = require("commander")
commander.add({
  {
    desc = "Search files",
    cat = "Telescope",
    cmd = function()
      require("telescope.builtin").find_files({
        find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' }
      })
    end,
    keys = { "n", "<leader>/" },
  },
  {
    desc = "Search by Word",
    cat = "Telescope",
    cmd = function() require("telescope.builtin").grep_string() end,
    keys = { "n", "<leader>sw" },
  },
  {
    desc = "Live Grep",
    cat = "Telescope",
    cmd = function() require("telescope.builtin").live_grep() end,
    keys = { "n", "<leader>sg" },
  },
})

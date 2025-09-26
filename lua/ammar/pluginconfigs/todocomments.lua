require("todo-comments").setup()

local commander = require("commander")
commander.add({
  { desc = "Search TODO comments", cat = "TODO", keys = { "n", "<leader>st" }, cmd = "<cmd>TodoTelescope<cr>" },
})

local bufnr = vim.api.nvim_get_current_buf()
local commander = require("commander")
commander.add({
  { desc = "Rust code action", cat = "Rust", keys = { "n", "<leader>a", { silent = true, buffer = bufnr } }, cmd = function()
      vim.cmd.RustLsp('codeAction')
    end },
  { desc = "Rust hover actions", cat = "Rust", keys = { "n", "K", { silent = true, buffer = bufnr } }, cmd = function()
      vim.cmd.RustLsp({'hover', 'actions'})
    end },
})

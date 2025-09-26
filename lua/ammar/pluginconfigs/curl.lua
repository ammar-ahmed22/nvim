local curl = require("curl")
curl.setup({})

local commander = require("commander")
commander.add({
  { desc = "Open curl tab", cat = "curl.nvim", keys = { "n", "<leader>cr" }, cmd = function() curl.open_curl_tab() end },
})

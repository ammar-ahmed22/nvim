local curl = require("curl")
curl.setup({})

vim.keymap.set("n", "<leader>cr", function()
  curl.open_curl_tab()
end)

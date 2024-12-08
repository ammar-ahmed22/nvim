local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon menu" })
vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
    print("Added file to harpoon.")
end, { desc = "Add to harpoon" })
vim.keymap.set("n", "<leader>x", function ()
    harpoon:list():remove();
    print("Removed file from harpoon.")
end, { desc = "Remove from harpoon"})

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)

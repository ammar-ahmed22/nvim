local harpoon = require("harpoon")

harpoon:setup()

local commander = require("commander")
commander.add({
  { desc = "Open harpoon menu", cat = "Harpoon", keys = { "n", "<C-h>" }, cmd = function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
  { desc = "Add to harpoon", cat = "Harpoon", keys = { "n", "<leader>a" }, cmd = function() harpoon:list():add(); print("Added file to harpoon.") end },
  { desc = "Remove from harpoon", cat = "Harpoon", keys = { "n", "<leader>x" }, cmd = function() harpoon:list():remove(); print("Removed file from harpoon.") end },
})

commander.add({
  { desc = "Harpoon 1", cat = "Harpoon", keys = { "n", "<C-1>" }, cmd = function() harpoon:list():select(1) end },
  { desc = "Harpoon 2", cat = "Harpoon", keys = { "n", "<C-2>" }, cmd = function() harpoon:list():select(2) end },
  { desc = "Harpoon 3", cat = "Harpoon", keys = { "n", "<C-3>" }, cmd = function() harpoon:list():select(3) end },
  { desc = "Harpoon 4", cat = "Harpoon", keys = { "n", "<C-4>" }, cmd = function() harpoon:list():select(4) end },
})

-- Toggle previous & next buffers stored within Harpoon list
commander.add({
  { desc = "Harpoon prev", cat = "Harpoon", keys = { "n", "<C-p>" }, cmd = function() harpoon:list():prev() end },
  { desc = "Harpoon next", cat = "Harpoon", keys = { "n", "<C-n>" }, cmd = function() harpoon:list():next() end },
})

local curr_idx = 1
commander.add({
  { desc = "Harpoon cycle", cat = "Harpoon", keys = { "n", "<C-c>" }, cmd = function()
    local len = harpoon:list():length()
    if len == 0 then
      print("No files in Harpoon!")
      return
    end
    harpoon:list():select(curr_idx)
    curr_idx = (curr_idx % len) + 1
  end },
})

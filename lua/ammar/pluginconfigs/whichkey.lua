if not package.loaded["which-key"] then
    vim.cmd([[packadd which-key.nvim]])
end

require("which-key").setup({
    preset = "modern",
    spec = {
        {"<leader>g", group = "Git"},
        {"<leader>s", group = "Search"},
        {"<leader>c", group = "ChatGPT"},
        {"<leader>n", group = "New"}
    },
    win = {
        border = "single",
        title = " Keybindings "
    }
})

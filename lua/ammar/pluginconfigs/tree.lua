require("neo-tree").setup({
  enable_git_status = true,
  enable_diagnostics = true,
  filesystem = {
    filtered_items = {
      visible = true
    },
    follow_current_file = {
      enabled = true
    }
  }
})

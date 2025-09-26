require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local commander = require("commander")

    commander.add({
      -- Navigation
      { desc = "Next hunk", cat = "Gitsigns", keys = { 'n', ']c', { buffer = bufnr } }, cmd = function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gs.nav_hunk('next')
          end
        end },
      { desc = "Prev hunk", cat = "Gitsigns", keys = { 'n', '[c', { buffer = bufnr } }, cmd = function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gs.nav_hunk('prev')
          end
        end },

      -- Actions
      { desc = "Hunk Stage", cat = "Gitsigns", keys = { 'n', '<leader>ghs', { buffer = bufnr } }, cmd = gs.stage_hunk },
      { desc = "Hunk Reset", cat = "Gitsigns", keys = { 'n', '<leader>ghr', { buffer = bufnr } }, cmd = gs.reset_hunk },
      { desc = "Hunk Stage (range)", cat = "Gitsigns", keys = { 'v', '<leader>ghs', { buffer = bufnr } }, cmd = function()
          gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end },
      { desc = "Hunk Reset (range)", cat = "Gitsigns", keys = { 'v', '<leader>ghr', { buffer = bufnr } }, cmd = function()
          gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end },
      { desc = "Hunk Preview", cat = "Gitsigns", keys = { 'n', '<leader>ghp', { buffer = bufnr } }, cmd = gs.preview_hunk },
      { desc = "Blame line", cat = "Gitsigns", keys = { 'n', '<leader>ghb', { buffer = bufnr } }, cmd = function()
          gs.blame_line({ full = false })
        end },
    })
  end,
})

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gs.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gs.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>ghs', gs.stage_hunk, { desc = "[G]it [H]unk [S]tage" })
    map('n', '<leader>ghr', gs.reset_hunk, { desc = "[G]it [H]unk [R]eset" })
    map('v', '<leader>ghs', function()
      gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = "[G]it [H]unk [S]tage" })

    map('v', '<leader>ghr', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = "[G]it [H]unk [R]eset" })
    map('n', '<leader>ghp', gs.preview_hunk, { desc = "[G]it [H]unk [P]review" })

    map('n', '<leader>ghb', function()
      gs.blame_line({ full = false })
    end, { desc = "[G]it [H]unk [B]lame" })
  end,
})

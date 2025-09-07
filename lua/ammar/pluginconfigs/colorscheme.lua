require("synthweave").setup({})

-- Keep the same theme (catppuccin-mocha) but make backgrounds transparent
vim.opt.background = "dark"

-- Configure catppuccin to use a transparent background and add overrides
local ok_catppuccin, catppuccin = pcall(require, "catppuccin")
if ok_catppuccin then
  catppuccin.setup({
    flavour = "mocha",
    transparent_background = true,
    integrations = {
      treesitter = true,
      telescope = true,
      gitsigns = true,
      which_key = true,
      native_lsp = { enabled = true },
      neotree = true,
      alpha = true,
      cmp = true,
    },
    custom_highlights = function()
      local background = "#414559"
      local foreground = "#bac2de"
      local muted_foreground = "#9399b2"
      return {
        -- Diagnostics: colored underlines by severity
        DiagnosticUnderlineError = { undercurl = true, sp = "#f38ba8" },
        DiagnosticUnderlineWarn  = { undercurl = true, sp = "#f9e2af" },
        DiagnosticUnderlineInfo  = { undercurl = true, sp = "#89b4fa" },
        DiagnosticUnderlineHint  = { undercurl = true, sp = "#94e2d5" },
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        NormalFloat = { bg = background },
        Pmenu = { bg = background },
        FloatBorder = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        FoldColumn = { bg = "NONE", fg = foreground },
        LineNr = { bg = "NONE", fg = foreground },
        CursorLine = { bg = background },
        CursorLineNr = { fg = "#ffd700", bold = true, bg = background },
        CursorLineFold = { bg = background },
        CursorLineSign = { bg = background },
        EndOfBuffer = { bg = "NONE" },

        -- Neo-tree
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },
        NeoTreeEndOfBuffer = { bg = "NONE" },
        NeoTreeWinSeparator = { bg = "NONE" },
        NeoTreeDotfile = { fg = muted_foreground },
        NeoTreeHiddenByName = { fg = muted_foreground },
        NeoTreeDimText = { fg = muted_foreground },
        NeoTreeGitIgnored = { fg = muted_foreground },

        -- Telescope
        TelescopeNormal = { bg = "NONE" },
        TelescopeBorder = { bg = "NONE" },
        TelescopePromptNormal = { bg = "NONE" },
        TelescopePromptBorder = { bg = "NONE" },
        TelescopeResultsNormal = { bg = "NONE" },
        TelescopeResultsBorder = { bg = "NONE" },
        TelescopePreviewNormal = { bg = "NONE" },
        TelescopePreviewBorder = { bg = "NONE" },

        -- Statusline / tabline / popups
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        TabLine = { bg = "NONE" },
        TabLineFill = { bg = "NONE" },
        TabLineSel = { bg = "NONE" },
        -- Keep Pmenu opaque by deferring to theme defaults

        -- Barbar (bufferline)
        BufferTabpageFill = { bg = "NONE" },
        BufferVisible = { fg = muted_foreground },
        BufferInactive = { fg = muted_foreground },
        -- BufferTabpages = { fg = "#bac2de" },
      }
    end,
  })
end

vim.cmd.colorscheme("catppuccin-mocha")

-- Ensure transparency persists even if colors are reset later
vim.api.nvim_create_augroup("TransparentBG", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "TransparentBG",
  callback = function()
    local groups = {
      "Normal", "NormalNC", "NormalFloat", "FloatBorder",
      "SignColumn", "FoldColumn", "LineNr", "CursorLine",
      "CursorLineNr", "EndOfBuffer", "StatusLine", "StatusLineNC",
      "TabLine", "TabLineFill", "TabLineSel",
      -- Telescope
      "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
      "TelescopePromptBorder", "TelescopeResultsNormal",
      "TelescopeResultsBorder", "TelescopePreviewNormal",
      "TelescopePreviewBorder",
      -- Neo-tree
      "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
      "NeoTreeWinSeparator",
      -- Barbar
      "BufferTabpageFill",
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
    -- Re-apply special CursorLineNr styling
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffd700", bold = true, bg = "NONE" })
    -- Ensure diagnostic underlines remain colored after any colorscheme reloads
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#f38ba8" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "#f9e2af" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = "#89b4fa" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = "#94e2d5" })
    vim.api.nvim_set_hl(0, "NeoTreeDotfile", { fg = "#bac2de" })
    vim.api.nvim_set_hl(0, "NeoTreeHiddenByName", { fg = "#bac2de" })
    vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = "#bac2de" })
    vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#bac2de" })
  end,
})

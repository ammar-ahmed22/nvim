require("leaf").setup({})

function SetColorScheme(color)
    color = color or "leaf"
    vim.cmd.colorscheme(color)

    -- Removing background color from everything
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
end

SetColorScheme()

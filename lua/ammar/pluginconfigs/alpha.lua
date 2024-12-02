local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
local utils = require'utils'

-- Maximum width of the ASCII art lines
local ascii_width = 53  -- Update this if your ASCII art width changes

-- Get the current working directory
local cwd = vim.fn.getcwd()

-- Formats the path by removing the $HOME path and adding ~
local formatted_cwd = utils.format_path(cwd)
dashboard.section.header.val = {
    [[                                    d8b              ]],
    [[                                    Y8P              ]],
    [[                                                     ]],
    [[88888b.   .d88b.   .d88b.  888  888 888 88888b.d88b. ]],
    [[888 "88b d8P  Y8b d88""88b 888  888 888 888 "888 "88b]],
    [[888  888 88888888 888  888 Y88  88P 888 888  888  888]],
    [[888  888 Y8b.     Y88..88P  Y8bd8P  888 888  888  888]],
    [[888  888  "Y8888   "Y88P"    Y88P   888 888  888  888]],
    [[                                                     ]],
    [[                                                     ]],
    utils.center_string("Welcome, Ammar", ascii_width),
    [[                                                     ]],
    utils.center_string(formatted_cwd, ascii_width),
}

dashboard.section.buttons.val = {
    dashboard.button( "⎵ + f",   "  Toggle file tree", ":NvimTreeToggle <CR>"),
    dashboard.button( "⎵ + /",   "  Find file", ":lua require'telescope.builtin'.find_files()<CR>"),
    dashboard.button( "⎵ + sg",  "  Find file with grep", ":lua require'telescope.builtin'.live_grep()<CR>"),
    dashboard.button( "⎵ + gac", "  Git add and commit", ":AddCommit<CR>"),
    dashboard.button( "⎵ + gs",  "  Git status", ":Git<CR>"),
    dashboard.button( "⎵ + cc",  "  Ask ChatGPT", ":ChatGPT<CR>"),
    dashboard.button( "⎵ + q",   "  Quit neovim" , ":qa<CR>"),
}

local day = tonumber(os.date("%d"))
local ordinal_day = utils.get_ordinal_date(day)
local datetime = os.date("%A, %B " .. ordinal_day .. " %Y -- %I:%M %p")

local verse = "Indeed, with hardship will be ease."
local verse_citation = "- Quran 93:5"
dashboard.section.footer.val = {
    utils.center_string(verse, ascii_width),
    utils.center_string(verse_citation, ascii_width),
    "",
    utils.center_string(datetime, ascii_width),
}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)

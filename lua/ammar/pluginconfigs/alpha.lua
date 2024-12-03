local alpha = require'alpha'
require("alpha.term")
local dashboard = require'alpha.themes.dashboard'
local utils = require'utils'

local custom_colors = {
    GR_1 = "#627BE9",
    GR_2 = "#5B99DD",
    GR_3 = "#54B4D1",
    GR_4 = "#4FD1C5",
    GR_5 = "#6399B3",
    GR_6 = "#6A619A",
    GR_7 = "#72499D",
    Default400 = "#71717a",
    Default500 = "#a1a1aa",
    Default600 = "#d4d4d8"
}

for key, value in pairs(custom_colors) do
    vim.api.nvim_set_hl(0, key, { fg = value })
end
local ascii = {
    [[                                      d8b               ]],
    [[                                      Y8P               ]],
    [[                                                        ]],
    [[  88888b.   .d88b.   .d88b.  888  888 888 88888b.d88b.  ]],
    [[  888 "88b d8P  Y8b d88""88b 888  888 888 888 "888 "88b ]],
    [[  888  888 88888888 888  888 Y88  88P 888 888  888  888 ]],
    [[  888  888 Y8b.     Y88..88P  Y8bd8P  888 888  888  888 ]],
    [[  888  888  "Y8888   "Y88P"    Y88P   888 888  888  888 ]],
}

local ascii_width = #ascii[1]
print(ascii_width)
local ascii_height = #ascii

-- Get the current working directory
local cwd = vim.fn.getcwd()

-- Formats the path by removing the $HOME path and adding ~
local formatted_cwd = utils.format_path(cwd)

local banner_lines = {}
-- Inserting the ascii art
for _, line in ipairs(ascii) do
    table.insert(banner_lines, line)
end

-- dashboard.section.header.val = banner_lines

-- Gradient array for header line
local parts = 7
local inc = ascii_width / parts
local gradient_hl_map = {}
local c = 0
for i = 1, parts do
    table.insert(gradient_hl_map, { "GR_" .. i, c, c + inc })
    c = c + inc
end

local banner_hl_opts = {}
for i = 1, ascii_height do
    table.insert(banner_hl_opts, gradient_hl_map)
end

local header_banner = {
    type = "text",
    val = banner_lines,
    opts = {
        hl = banner_hl_opts,
        position = "left"
    }
}

local header = {
    type = "group",
    val = {
        header_banner,
        -- {
        --     type = "text",
        --     val = {
        --         utils.center_string("Welcome, Ammar.", 25),
        --         utils.center_string(formatted_cwd, 25)
        --     },
        --     opts = {
        --         position = "center",
        --         hl = "GR_1"
        --     }
        -- }
    },
    opts = {
        spacing = 2,
    }
}

dashboard.section.header = header
print(dashboard.section.header.type)
dashboard.section.buttons.val = {
    dashboard.button( "⎵ + f",   "  Toggle file tree", ":NvimTreeToggle <CR>"),
    dashboard.button( "⎵ + /",   "  Find file", ":lua require'telescope.builtin'.find_files()<CR>"),
    dashboard.button( "⎵ + sg",  "  Find file with grep", ":lua require'telescope.builtin'.live_grep()<CR>"),
    dashboard.button( "⎵ + gac", "  Git add and commit", ":AddCommit<CR>"),
    dashboard.button( "⎵ + gs",  "  Git status", ":Git<CR>"),
    dashboard.button( "⎵ + cc",  "  Ask ChatGPT", ":ChatGPT<CR>"),
    dashboard.button( "⎵ + q",   "  Quit neovim" , ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = {{"Default600", 0, 1}, { "Default500", 1, -1 }}
    button.opts.hl_shortcut = "GR_1"
end

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

dashboard.section.footer.opts.hl = {
    {{ "GR_4", 0, -1}},
    {{ "GR_4", 0, -1}},
    {{ "Default500", 0, -1}},
    {{ "Default500", 0, -1}}
}
dashboard.config.opts.noautocmd = true

print(dashboard.config.layout)
alpha.setup(dashboard.config)

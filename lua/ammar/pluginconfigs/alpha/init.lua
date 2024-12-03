local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
local utils = require'utils'
-- 1. **#72499D** - Start color
-- 2. **#6E58A3** - Intermediate color
-- 3. **#6A67A9** - Intermediate color
-- 4. **#6676AF** - Intermediate color
-- 5. **#6285B5** - Intermediate color
-- 6. **#5E94BB** - Intermediate color
-- 7. **#5AA3C1** - Intermediate color
-- 8. **#54B4D1** - End color

-- Custom colors
local custom_colors = {
    AmmarPrimary = "#627BE9",
    AmmarTeal = "#54B4D1",
    AmmarSecondary = "#72499D",
    Default400 = "#71717a",
    Default500 = "#a1a1aa",
    Default600 = "#d4d4d8",
    AmmarGR1 = "#72499D",
    AmmarGR2 = "#6E58A3",
    AmmarGR3 = "#6A67A9",
    AmmarGR4 = "#6676AF",
    AmmarGR5 = "#6285B5",
    AmmarGR6 = "#5E94BB",
    AmmarGR7 = "#5AA3C1",
    AmmarGR8 = "#54B4D1"
}
-- Setting custom color hl groups
for key, value in pairs(custom_colors) do
    vim.api.nvim_set_hl(0, key, { fg = value })
end

local ascii = {}
local ascii_file = io.open("./lua/ammar/pluginconfigs/alpha/ascii.txt", "r")
if ascii_file then
    for line in ascii_file:lines() do
        table.insert(ascii, line)
    end
    ascii_file:close()
else
    print("ASCII file not found! Using default banner.")
end


-- Inserting the ascii art
local banner_lines = {}
for _, line in ipairs(ascii) do
    table.insert(banner_lines, line)
end

local banner_hl = {}
for i = 1,8 do
    table.insert(banner_hl, {{ "AmmarGR" .. i, 0, -1 }})
end

local header_banner = {
    type = "text",
    val = banner_lines,
    opts = {
        hl = banner_hl,
        position = "center"
    }
}
dashboard.section.header.type = "group"

local curr_hour = tonumber(os.date("%H"))
local is_morning = curr_hour >= 4 and curr_hour < 12
local is_afternoon = curr_hour >= 12 and curr_hour < 5

local greeting = "Good "
if is_morning then
    greeting = greeting .. "morning"
elseif is_afternoon then
    greeting = greeting .. "afternoon"
else
    greeting = greeting .. "evening"
end

local time = os.date("%I:%M %p")

local header_welcome = {
    type = "text",
    val = greeting .. ", Ammar. It is " .. time,
    opts = {
        position = "center",
        hl = "Default500",
    }
}

local header_cwd = {
    type = "text",
    val = "You are in: " .. utils.format_path(vim.fn.getcwd()),
    opts = {
        position = "center",
        hl = {{ "Default500", 0, 12}, { "AmmarTeal", 13, -1 }},
    }
}

dashboard.section.header.val = {
    header_banner,
    header_welcome,
    header_cwd
}

dashboard.section.header.opts = {
    spacing = 1,
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
-- Setting button colors
for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = {{"Default600", 0, 1}, { "Default500", 1, -1 }}
    button.opts.hl_shortcut = "GR_3"
end

-- Getting day properly formatted 1st, 2nd, 3rd, 4th, etc.
local day = tonumber(os.date("%d"))
local ordinal_day = utils.get_ordinal_date(day)
local date = os.date("%A, %B " .. ordinal_day .. " %Y")


-- Quran verse
local verse = "Indeed, with hardship will be ease."
local verse_citation = "- Quran 93:5"
dashboard.section.footer.val = {
    verse,
    utils.right_string(verse_citation, #verse),
    "",
    utils.center_string(date, #verse)
}

dashboard.section.footer.opts.position = "center"
dashboard.section.footer.opts.hl = {
    {{ "Default500", 0, -1}},
    {{ "Default400", 0, -1}},
    {{ "Default500", 0, -1}},
    {{ "Default500", 0, -1}}
}
dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)



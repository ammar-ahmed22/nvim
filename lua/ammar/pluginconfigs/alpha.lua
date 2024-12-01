local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'

-- Get the current working directory
local cwd = vim.fn.getcwd()

-- Maximum width of the ASCII art lines
local ascii_width = 53  -- Update this if your ASCII art width changes

-- Function to center a string within a given width
local function center_string(str, width)
    local str_len = #str
    if str_len > width then
        -- Truncate the string and add ellipsis if it's too long
        return str:sub(1, width - 3) .. "..."
    else
        -- Add padding to center the string
        local padding = math.ceil((width - str_len) / 2)
        return string.rep(" ", padding) .. str .. string.rep(" ", padding)
    end
end

local centered_cwd = center_string(cwd, ascii_width)
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
    center_string("Welcome, Ammar", ascii_width),
    [[                                                     ]],
    centered_cwd,
}

dashboard.section.buttons.val = {
    dashboard.button( "e",       "  New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "SPC f",   "  Open File Tree", ":NvimTreeOpen <CR>"),
    dashboard.button( "SPC /",   "  Find File", ":lua require'telescope.builtin'.find_files()<CR>"),
    dashboard.button( "SPC c c", "  Ask ChatGPT", ":ChatGPT<CR>"),
    dashboard.button( "SPC g s", "  Git Status", ":Git<CR>"),
    dashboard.button( "SPC q",   "  Quit NVIM" , ":qa<CR>"),
}

dashboard.config.opts.noautocmd = true

vim.cmd[[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.config)

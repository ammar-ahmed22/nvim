
local M = {}

function M.get_ordinal_date(day)
    local suffixes = {
        st = { 1, 21, 31 },
        nd = {2, 22},
        rd = {3, 23}
    }

    for suffix, days in pairs(suffixes) do
        if vim.tbl_contains(days, day) then
            return day .. suffix
        end
    end

    return day .. "th"
end

function M.center_string(str, width)
    local str_len = #str
    if str_len > width then
        return str:sub(1, width - 3) .. "..."
    end
    local padding = math.floor((width - str_len) / 2)
    return string.rep(" ", padding) .. str .. string.rep(" ", padding)
end

function M.right_string(str, width)
    if #str > width then
        return str
    end
    local padding = width - #str
    return string.rep(" ", padding) .. str
end

function M.format_path(path)
    return vim.fn.fnamemodify(path, ":~")
end

function M.say_hello()
    print("Hello world from utils!")
end


return M

local nightfly = require("lualine.themes.nightfly")

nightfly.normal.c.bg = "none"
nightfly.normal.c.bg = "none"

require('lualine').setup {
  options = {
    theme = nightfly,
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
        statusline = { "NvimTree" },
        winbar = { "NvimTree", "alpha" },
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = {  'branch' },
    lualine_c = {
      '%=', --[[ add your center compoentnts here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'os.date("%a, %b " .. require("utils").get_ordinal_date(tonumber(os.date("%d"))) .. " %Y")' },
    lualine_z = {
      { 'os.date("%I:%M %p")', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  winbar = {
      lualine_a = {{"filename",  separator = { left = '' }, left_padding = 2 }},
      lualine_b = {'diff', 'diagnostics'},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
      },
  },
  inactive_winbar = {
      lualine_a = {"filename"}
  },
}

vim.g.opencode_opts = {}

vim.opt.autoread = true
local commander = require("commander")
commander.add({
  { desc = "Toggle Opencode", cat = "Opencode", keys = { 'n', '<leader>ot' }, cmd = function() require('opencode').toggle() end },
  { desc = "Ask Opencode", cat = "Opencode", keys = { 'n', '<leader>oA' }, cmd = function() require('opencode').ask() end },
  { desc = "Ask about cursor", cat = "Opencode", keys = { 'n', '<leader>oa' }, cmd = function() require('opencode').ask('@cursor: ') end },
  { desc = "Ask about selection", cat = "Opencode", keys = { 'v', '<leader>oa' }, cmd = function() require('opencode').ask('@selection: ') end },
  { desc = "New Opencode session", cat = "Opencode", keys = { 'v', '<leader>on' }, cmd = function() require('opencode').command('session_new') end },
  { desc = "Copy Opencode response", cat = "Opencode", keys = { 'n', '<leader>oy' }, cmd = function() require('opencode').command('messages_copy') end },
  { desc = 'Messages half page up', cat = "Opencode", keys = { 'n', '<S-C-u>' }, cmd = function() require('opencode').command('messages_half_page_up') end },
  { desc = 'Messages half page down', cat = "Opencode", keys = { 'n', '<S-C-d>' }, cmd = function() require('opencode').command('messages_half_page_down') end },
  { desc = 'Select Opencode prompt', cat = "Opencode", keys = { { 'n', 'v' }, '<leader>os' }, cmd = function() require('opencode').select() end },
})

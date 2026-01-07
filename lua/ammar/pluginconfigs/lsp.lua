vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP keybindings',
  callback = function(event)
    local commander = require('commander')
    local bufopt = { buffer = event.buf }

    commander.add({
      { desc = 'LSP Definition', cat = 'LSP', keys = { 'n', 'gd', bufopt }, cmd = function() vim.lsp.buf.definition() end },
      { desc = 'LSP Hover', cat = 'LSP', keys = { 'n', 'K', bufopt }, cmd = function() vim.lsp.buf.hover() end },
      { desc = 'LSP Workspace Symbols', cat = 'LSP', keys = { 'n', '<leader>vws', bufopt }, cmd = function() vim.lsp.buf.workspace_symbol() end },
      { desc = 'Diagnostics Float', cat = 'LSP', keys = { 'n', '<leader>vd', bufopt }, cmd = function() vim.diagnostic.open_float() end },
      { desc = 'Diagnostics Prev', cat = 'LSP', keys = { 'n', '[d', bufopt }, cmd = function() vim.diagnostic.goto_prev() end },
      { desc = 'Diagnostics Next', cat = 'LSP', keys = { 'n', ']d', bufopt }, cmd = function() vim.diagnostic.goto_next() end },
      { desc = 'Code Action', cat = 'LSP', keys = { 'n', '<leader>ca', bufopt }, cmd = function() vim.lsp.buf.code_action() end },
      { desc = 'Fix All', cat = 'LSP', keys = { 'n', '<leader>cf', bufopt }, cmd = function()
          vim.lsp.buf.code_action({ context = { only = { 'source.fixAll' } }, apply = true })
        end },
      { desc = 'References', cat = 'LSP', keys = { 'n', '<leader>vrr', bufopt }, cmd = function() vim.lsp.buf.references() end },
      { desc = 'Rename', cat = 'LSP', keys = { 'n', '<leader>vrn', bufopt }, cmd = function() vim.lsp.buf.rename() end },
      { desc = 'Signature Help', cat = 'LSP', keys = { 'i', '<C-h>', bufopt }, cmd = function() vim.lsp.buf.signature_help() end },
      { desc = 'Format Buffer', cat = 'LSP', keys = { 'n', '<leader>cw', bufopt }, cmd = function() vim.lsp.buf.format({ async = false }) end },
    })
  end
})

local lspconfig = vim.lsp.config
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- require('mason-lspconfig').setup_handlers {
--   ['rust_analyzer'] = function() end,
-- }
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'lua_ls',
    -- 'rust_analyzer',
    'tinymist',
    'pyright',
    'html',
    'gopls',
    'clangd',
  },
  handlers = {
    function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end,
    lua_ls = function()
      lspconfig.lua_ls.setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' }
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          }
        }
      })
    end,
  },
})

-- Setup dartls separately since it's not managed by Mason (TODO: figure this out with the new vim.lsp.config syntax instead of require('lspconfig'))
-- lspconfig.dartls.setup({
--   capabilities = lsp_capabilities,
--   cmd = { "dart", "language-server", "--protocol=lsp" },
--   init_options = {
--     closingLabels = true,
--     flutterOutline = true,
--     outline = true,
--     onlyAnalyzeProjectsWithOpenFiles = true,
--     suggestFromUnimportedLibraries = true,
--   },
--   settings = {
--     dart = {
--       completeFunctionCalls = true,
--       showInspectorNotificationsForWidgetErrors = true,
--     }
--   }
-- })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

--- loads custom snippets from friendly-snippets
-- require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    -- {name = 'buffer', keyword_length = 3},
    -- {name = 'luasnip', keyword_length = 2},
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  }),
  window = {
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- Diagnostics configuration: keep signs but use underlines per severity
vim.diagnostic.config({
  underline = { severity = { min = vim.diagnostic.severity.HINT } },
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

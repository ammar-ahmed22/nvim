-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Windows for search and chat gpt as well
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-ui-select.nvim' } },
  }
  -- Synthwave 84 theme
  use { "samharju/synthweave.nvim" }
  -- Oxocarbon theme
  use { "nyoom-engineering/oxocarbon.nvim" }
  -- Catpuccin theme
  use { "catppuccin/nvim", as = "catppuccin" }
  -- AST generator for better syntax highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  -- Git status page + other git commands
  use('tpope/vim-fugitive')
  -- Language server
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- LSP Support
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  -- Autopairing brackets and quotes
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      npairs.add_rule(
        Rule("$", "$", { "tex", "latex", "typst" })
      )
    end
  }
  -- Comments
  use {
    'numToStr/Comment.nvim',
    requires = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  }
  -- Git signs beside lines
  use {
    'lewis6991/gitsigns.nvim',
  }
  -- Help menu for keybindings
  use {
    'folke/which-key.nvim',
    event = 'VimEnter',
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
  -- Bottom status bar plugin
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  }
  -- ChatGPT plugin
  use {
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
  -- Command autocomplete
  use { 'ammar-ahmed22/command-completion.nvim' }
  use {
    'goolord/alpha-nvim',
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  }
  use {
    "theprimeagen/vim-be-good",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
  use {
    "nvimtools/none-ls.nvim",
    requires = {
      "nvimtools/none-ls-extras.nvim"
    }
  }
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end
  }
  use {
    "github/copilot.vim"
  }
  use {
    "romgrk/barbar.nvim"
  }
  use {
    "folke/flash.nvim",
    config = function()
      require('flash').setup()
    end
  }
  use {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require('nvim-surround').setup()
    end
  }
  use {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async"
  }
  use {
    'mrcjkb/rustaceanvim'
  }
  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  use {
    'oysandvik94/curl.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'NickvanDyke/opencode.nvim',
    requires = {
      'folke/snacks.nvim', config = function() require('snacks').setup({ input = { enabled = true } }) end,
    },
  }
  use {
    'goerz/jupytext.nvim',
    tag = 'v0.2.0',
    config = function()
      require('jupytext').setup({})
    end,
  }
  use {
    "benlubas/molten-nvim",
    run = ":UpdateRemotePlugins",
    config = function()
      -- set globals (examples; all are optional)
      vim.g.molten_image_provider = "none" -- or "wezterm" or "none"
      vim.g.molten_auto_open_output = true

      -- handy keymaps via commander
      local commander = require("commander")
      commander.add({
        { desc = "Molten Init python3",    cat = "Molten", keys = { "n", "<localleader>mi", { silent = true } }, cmd = ":MoltenInit python3<CR>" },
        { desc = "Molten Evaluate Line",   cat = "Molten", keys = { "n", "<localleader>rl", { silent = true } }, cmd = ":MoltenEvaluateLine<CR>" },
        { desc = "Molten Evaluate Visual", cat = "Molten", keys = { "v", "<localleader>rv", { silent = true } }, cmd = ":<C-u>MoltenEvaluateVisual<CR>gv" },
        { desc = "Molten Enter Output",    cat = "Molten", keys = { "n", "<localleader>oo", { silent = true } }, cmd = ":noautocmd MoltenEnterOutput<CR>" },
      })
    end,
  }
  use {
    "FeiyouG/commander.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("commander").setup()
      -- commander.add expects a list of items; wrap the item in an extra table
      require("commander").add({
        {
          desc = "Open commander",
          cmd = require("commander").show,
          keys = { "n", "<leader>p", { noremap = true, silent = true } },
        }
      })
    end
  }
  use {
    'chomosuke/typst-preview.nvim',
    tag = 'v1.*',
    config = function()
      require 'typst-preview'.setup {}
    end,
  }
end)

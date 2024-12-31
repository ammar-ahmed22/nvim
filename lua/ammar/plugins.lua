-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Windows for search and chat gpt as well
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} },
  }
  -- Synthwave 84 theme
  use { "samharju/synthweave.nvim" }
  use { "nyoom-engineering/oxocarbon.nvim" }
  -- AST generator for better syntax highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  -- Git status page + other git commands
  use('tpope/vim-fugitive')
  -- Language server 
  use {
      'neovim/nvim-lspconfig',
	  requires = {
		  -- LSP Support
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
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
      config = function ()
        require("Comment").setup({
            pre_hook = function (ctx)
                return require('Comment.jsx').calculate(ctx)
            end
        })
      end
  }
  -- Git signs beside lines
  use {
      'lewis6991/gitsigns.nvim',
      config = function ()
        require('gitsigns').setup()
      end
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
  -- File tree 
  -- use {
  --     'nvim-tree/nvim-tree.lua',
  --     requires = {
  --         'nvim-tree/nvim-web-devicons', -- optional
  --     },
  -- }
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
  use {'~/Documents/Projects/nvim/command-completion.nvim'}
  use {
      'goolord/alpha-nvim',
  }
  use {
       "lukas-reineke/indent-blankline.nvim",
       config = function ()
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
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use {
      "windwp/nvim-ts-autotag",
      config = function ()
        require("nvim-ts-autotag").setup()
      end
  }
end)

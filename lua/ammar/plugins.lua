-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Windows for search and chat gpt as well
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} },
      config = function ()
        require("telescope").setup({
            defaults = {
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
            }
        })
      end

  }
  -- Color scheme
  use {
      'daschw/leaf.nvim',
      as = "leaf",
  }
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
      end
  }
  -- Comments
  use {
      'numToStr/Comment.nvim',
      config = function ()
        require("Comment").setup()
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
      config = function ()
        require("which-key").setup({
            preset = "modern",
            spec = {
                {"<leader>g", group = "Git"},
                {"<leader>s", group = "Search"},
                {"<leader>c", group = "ChatGPT"}
            }
        })
      end
  }
  -- File tree 
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional
      },
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
      },
      config = function ()
        require("chatgpt").setup({
            openai_params = {
                model = "gpt-4o",
                max_tokens = 4096,
            }
        })
      end
  }
  -- Command autocomplete
  use {'~/Documents/Projects/nvim/command-completion.nvim'}
end)

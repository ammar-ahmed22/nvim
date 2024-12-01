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
      }
  }
  -- Command autocomplete
  use {'~/Documents/Projects/nvim/command-completion.nvim'}
  use {
      'goolord/alpha-nvim',
      config = function ()
          -- -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
          -- local alpha = require'alpha'
          -- local dashboard = require'alpha.themes.dashboard'
          -- dashboard.section.header.val = {
          --     [[                               __                ]],
          --     [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
          --     [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
          --     [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
          --     [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
          --     [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
          -- }
          -- dashboard.section.buttons.val = {
          --     dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
          --     dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
          --     dashboard.button( "<leader>/", "   Find File", ":lua require'telescope.builtin'.find_files()<CR>")
          -- }
          -- local handle = io.popen('fortune')
          -- local fortune = handle:read("*a")
          -- handle:close()
          -- dashboard.section.footer.val = fortune
          --
          -- dashboard.config.opts.noautocmd = true
          --
          -- vim.cmd[[autocmd User AlphaReady echo 'ready']]
          --
          -- alpha.setup(dashboard.config)
      end
  }
end)

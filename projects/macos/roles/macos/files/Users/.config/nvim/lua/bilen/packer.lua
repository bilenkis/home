return require('packer').startup(function(use)
  use("wbthomason/packer.nvim")
  use("sbdchd/neoformat")

  use("preservim/nerdtree")
  use("tpope/vim-fugitive")

  use("nvim-lua/popup.nvim")

  -- All the things
  use("neovim/nvim-lspconfig")

  -- cmp
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")

  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip")

  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  use {
    "ruifm/gitlinker.nvim",
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup()
    end
  }

  use("mbbill/undotree")

  use("tpope/vim-surround")
  use("tpope/vim-repeat")

  -- Colorscheme section
  use("gruvbox-community/gruvbox")

  use {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.8.1',
    run = ':TSUpdate'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use 'ibhagwan/fzf-lua'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use("ggandor/lightspeed.nvim")

  use("github/copilot.vim")

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  -- use("juliosueiras/vim-terraform-completion")
  use("hashivim/vim-terraform")

  use {
    'gennaro-tedesco/nvim-jqx',
    ft = { 'json', 'yaml', 'yml' },
  }

  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
  })

  use('towolf/vim-helm')
end)

local config = {

  -- Set colorscheme
  colorscheme = "gruvbox",

  options = {
    g = {
      background = "dark",
      -- terraform
      terraform_fmt_on_save = 1,
      -- jsonnet
      jsonnet_fmt_on_save = 1,
      jsonnet_fmt_fail_silently = 0,
      autowriteall = true,
      nohlsearch = true,
    },
    opt = {
      mouse = "",
    },
  },

  plugins = {

    init = {
      { "gruvbox-community/gruvbox" },
      { "google/vim-jsonnet" },
      { "hashivim/vim-terraform" },
      {"tpope/vim-surround"},
      { "ggandor/lightspeed.nvim" },
      {"tpope/vim-repeat"},
      {"tpope/vim-fugitive"},
      {"tpope/vim-rhubarb"},
      {
      "kyazdani42/nvim-tree.lua",
        config = function()
          require("nvim-tree").setup {
            actions = {
              open_file = {
                quit_on_open = true,
                window_picker = {
                  enable = false,
                },
              },
            },
            view = {
              adaptive_size = true,
            },
            filters = {
              custom = {
                "^.git$",
                "^.terraform$",
              },
            },
            git = {
              enable = false,
            },
          }
        end,
      },
      ["nvim-neo-tree/neo-tree.nvim"] = {disable = true},
    },

    telescope = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--hidden",
          "--glob",
          "!.git",
          "--glob",
          "!.terraform",
        },
      },
      pickers = {
       find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix","--no-ignore", "--hidden", "--exclude", "*.git", "--exclude", "*.terraform"},
          prompt_prefix = ">"
        } ,
      },
    },
  },

  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      ["<leader>Y"] = { ":let @*=expand('%:p:h:t')<cr>", desc = "Yank current dir name" },
      ["<leader>e"] = { ":NvimTreeFindFileToggle<cr>", desc = "Reveal Current File" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  polish = function()
      -- Set autocommands
      vim.api.nvim_create_augroup("packer_conf", {})
      vim.api.nvim_create_autocmd("BufWritePost", {
        desc = "Sync packer after modifying plugins.lua",
        group = "packer_conf",
        pattern = "plugins.lua",
        command = "source <afile> | PackerSync",
      })

      -- Set up custom filetypes
      -- vim.filetype.add {
      --   extension = {
      --     foo = "fooscript",
      --   },
      --   filename = {
      --     ["Foofile"] = "fooscript",
      --   },
      --   pattern = {
      --     ["~/%.config/foo/.*"] = "fooscript",
      --   },
      -- }
    end,
}

return config

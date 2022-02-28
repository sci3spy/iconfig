local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

require("packer").init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

return require("packer").startup(function(use)
  -- My plugins here

  -- Well, packer itself
  use "wbthomason/packer.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"

  -- LSP servers installer
  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require "lsp_config"
    end,
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
      "onsails/lspkind-nvim",
    },
    config = function()
      require "completion"
    end,
  }

  -- General purpose LSPs e.g. formaters etc.
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      local format = null_ls.builtins.formatting
      null_ls.setup {
        sources = {
          format.stylua.with {
            extra_args = {
              "--call-parentheses",
              "None",
              "--indent-type",
              "Spaces",
              "--indent-width",
              "2",
            },
          },
          format.black,
          format.prettier,
          format.eslint_d,
        },
      }
    end,
  }

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require "luasnip"
      luasnip.config.setup {
        history = true,
      }
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  }

  -- Telescope: fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
      require("telescope").load_extension "fzf"
    end,
  }

  -- Treesitter
  -- TODO: More exploration!
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
          "cpp",
          "rust",
          "python",
          "typescript",
          "javascript",
          "bash",
          "markdown",
          "html",
          "css",
        },
        highlight = { enable = true },
        autopairs = { enable = true },
      }
    end,
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }

  -- Gruuuuvbox colorscheme
  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.o.termguicolors = true
      vim.o.background = "dark"
      vim.g["gruvbox_contrast_dark"] = "medium"
      vim.g["gruvbox_contrast_light"] = "soft"
      vim.cmd "colorscheme gruvbox"
      -- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    end,
  }

  -- Lua statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        options = {
          theme = "gruvbox",
          component_separators = { "|", "|" },
          section_separators = { "" },
        },
        sections = {
          lualine_x = { "filetype" },
        },
      }
    end,
  }

  -- Indentation guides
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
      }
    end,
  }

  -- Gitsigns support
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup()
    end,
  }

  -- Color-codes colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }

  -- Comments
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

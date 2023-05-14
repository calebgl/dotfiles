local plugins = {

  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },

  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- {
  --   "mfussenegger/nvim-dap",
  --   init = function()
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  --

  {
    "tpope/vim-fugitive",
    lazy = false
  },

  -- rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end
  },

  -- -- golang
  -- {
  --   "dreamsofcode-io/nvim-dap-go",
  --   ft = "go",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function(_, opts)
  --     require("dap-go").setup(opts)
  --     -- require("core.utils").load_mappings("dap_go")
  --   end
  --
  -- },

  -- tweaks
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "custom.configs.indent-blankline"
      require("core.utils").load_mappings("blankline")
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    },
    keys = function()
      return require("custom.configs.neo-tree").keys
    end,
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      require("custom.configs.neo-tree").init()
    end,
    opts = function()
      return require("custom.configs.neo-tree").opts
    end,
    config = function(_, opts)
      require("neo-tree").setup(opts)
      require("custom.configs.neo-tree").termClose()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false
  }
}

return plugins

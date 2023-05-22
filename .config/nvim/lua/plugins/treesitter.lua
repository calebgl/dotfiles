return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    keys = {
      { "<leader>tnn" },
      { "<leader>trn" },
      { "<leader>trc" },
      { "<leader>trm" }
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>tnn",
            node_incremental = "<leader>trn",
            scope_incremental = "<leader>trc",
            node_decremental = "<leader>trm",
          },
        },

      })
    end

  }
}

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        floats = "transparent"
      }
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-storm")
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  }
}

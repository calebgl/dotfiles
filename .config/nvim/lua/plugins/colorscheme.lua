return {
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    opts = {
      transparent_background = true
    },
    config = function()
      vim.cmd.colorscheme("catppuccin-frappe")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  }
}

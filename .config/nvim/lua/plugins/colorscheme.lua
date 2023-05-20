return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    init = function()
      vim.cmd.colorscheme("rose-pine")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.cmd([[highlight Visual  guifg=White guibg=LightBlue gui=none]])
    end
  }
}

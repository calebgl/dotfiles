return {
	{
		"rose-pine/neovim",
		priority = 1000,
		opts = {
			disable_background = true,
			disable_float_background = true,
			disable_italics = true,
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}

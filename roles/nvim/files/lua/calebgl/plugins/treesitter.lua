return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true, disable = { "html" } },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			vim.cmd.highlight("TreesitterContext gui=none")
			vim.cmd.highlight("TreesitterContextSeparator gui=none")
			vim.cmd.highlight("TreesitterContextBottom gui=none")
			require("treesitter-context").setup({
				max_lines = 4,
				separator = "-",
			})
		end
	}
}

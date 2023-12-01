return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-s>"] = "delete_buffer",
						},
						n = {
							["d"] = "delete_buffer",
						},
					},
				},
			},
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fh", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" },
			{ "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
			{ "<leader>f:", "<cmd>Telescope command_history<cr>" },
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		priority = 1000,
		keys = {
			{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
		},
	},

	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>" },
		},
	},
}

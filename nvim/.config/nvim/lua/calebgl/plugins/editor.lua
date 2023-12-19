return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",

			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		opts = {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
					"-u",
				},
			},
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
			{ "<leader>fh", "<cmd>Telescope find_files hidden=true no-ignore=true<cr>" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
			{ "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
			{ "<leader>f:", "<cmd>Telescope command_history<cr>" },
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			pcall(telescope.load_extension, "fzf")
		end,
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
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>" },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
			vim.cmd.highlight("GitSignsAdd guibg=NONE")
			vim.cmd.highlight("GitSignsChange guibg=NONE")
			vim.cmd.highlight("GitSignsDelete guibg=NONE")
		end,
	},
}

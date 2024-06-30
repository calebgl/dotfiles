return {
	"stevearc/oil.nvim",
	opts = {},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,

				is_always_hidden = function(name)
					return name == "node_modules" or name == "." or name == ".."
				end,

				natural_order = true,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
	end,
}

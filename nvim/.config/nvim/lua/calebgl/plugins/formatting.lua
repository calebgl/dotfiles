return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "golines", "gofumpt", "goimports" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
			},
		},
		keys = {
			{
				"<leader>lp",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		-- format on save
		-- config = function(_, opts)
		--     local conform = require("conform")
		--     conform.setup(opts)
		--     vim.api.nvim_create_autocmd("BufWritePre", {
		--         pattern = "*",
		--         callback = function(args)
		--             conform.format({ bufnr = args.buf })
		--         end,
		--     })
		-- end
	},
}

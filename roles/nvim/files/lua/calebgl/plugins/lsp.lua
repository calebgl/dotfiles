local servers = {
	tsserver = {},
	gopls = {
		settings = {
			gopls = {
				staticcheck = true,
				usePlaceholders = true,
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		"folke/neodev.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		require("neodev").setup()

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		vim.diagnostic.config({
			update_in_insert = true,
			float = {
				focusable = true,
				style = "minimal",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}

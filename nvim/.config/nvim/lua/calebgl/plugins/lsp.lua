local servers = {
	gopls = {
		gofumpt = true,
	},
	pyright = {},
	lua_ls = {
		Lua = {
			semantic = { enable = false },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { globals = { "vim" } },
		},
	},
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
			"folke/neodev.nvim",
		},
		config = function()
			local keymap = vim.keymap
			local on_attach = function(_, bufnr)
				-- client.server_capabilities.semanticTokensProvider = nil

				local opts = { buffer = bufnr, noremap = true, silent = true }

				keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", opts)
				keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
			end

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("mason").setup()
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					})
				end,
			})
		end,
	},
}

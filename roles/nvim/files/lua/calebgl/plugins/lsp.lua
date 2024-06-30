local servers = {
	tsserver = {
		commands = {
			OrganizeImports = {
				function()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
						title = "",
					}
					vim.lsp.buf.execute_command(params)
				end,
				description = "Organize imports",
			},
		},
	},
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
					if server_name ~= "jdtls" then
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end
				end,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("CalebGL_LspConfig", { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
				vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)
				vim.keymap.set("n", "<leader>ld", require("telescope.builtin").lsp_type_definitions, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set({ "n", "i" }, "<c-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
			end,
		})

		vim.keymap.set("n", "<leader>lo", "<cmd>OrganizeImports<cr>", { remap = true })

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

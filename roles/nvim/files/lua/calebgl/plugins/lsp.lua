local servers = {
	tsserver = {},
	lua_ls = {
		settings = {
			Lua = {
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim" },
				}
			}
		}
	}
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("CalebGL_LspConfig", { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf }
				local builtin = require("telescope.builtin")

				vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
				vim.keymap.set("n", "gr", builtin.lsp_references, opts)
				vim.keymap.set("n", "gI", builtin.lsp_implementations, opts)
				vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, opts)
				vim.keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, opts)
				vim.keymap.set("n", "<leader>lws", builtin.lsp_dynamic_workspace_symbols, opts)

				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, opts)
			end
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end
			}
		}

		vim.diagnostic.config {
			update_in_insert = true,
			float = {
				focusable = true,
				style = "minimal",
				source = true,
				header = "",
				prefix = "",
			}
		}
	end
}

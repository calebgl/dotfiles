local function augroup(name)
	return vim.api.nvim_create_augroup("CalebGL_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("HighlightYank"),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("CloseWithQ"),
	pattern = {
		"help",
		"man",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup("LspConfig"),
	callback = function(event)
		local opts = { buffer = event.buf }

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

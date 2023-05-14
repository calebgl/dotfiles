local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.eslint,
  formatting.gofmt,
  formatting.goimports_reviser,
  formatting.golines,

  lint.eslint,
  lint.codespell
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufrn = bufnr,
            filter = function(filter_client)
              return filter_client.name == "null-ls"
            end
          })
        end
      })
    end
  end
}

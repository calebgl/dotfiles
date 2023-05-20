return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
    init = function()
      local lsp = require('lsp-zero')

      lsp.preset('recommended')
      lsp.ensure_installed({
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'gopls'
      })
      lsp.nvim_workspace()

      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
      end)

      lsp.configure('gopls', {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true
            }
          }
        }
      })

      lsp.setup()
    end
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      { "VonHeikemen/lsp-zero.nvim" }
    },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local lint = null_ls.builtins.diagnostics
      null_ls.setup({
        sources = {
          formatting.gofmt,
          formatting.goimports_reviser,
          formatting.golines,
          lint.codespell
        }
      })
    end
  }
}

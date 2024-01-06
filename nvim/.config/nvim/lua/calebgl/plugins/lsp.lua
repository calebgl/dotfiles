local servers = {
    gopls = {},
    pyright = {},
    lua_ls = {
        Lua = {
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
    tsserver = {},
    astro = {},
    svelte = {},
    -- tailwindcss = {}
}

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end,
        })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = true,
                style = "minimal",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}

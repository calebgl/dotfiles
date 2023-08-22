return {
    -- {
    --   'folke/tokyonight.nvim',
    --   lazy = false,
    --   opts = {
    --     style = "storm",
    --     transparent = true,
    --     styles = {
    --       floats = "transparent"
    --     }
    --   },
    --   config = function(_, opts)
    --     require("tokyonight").setup(opts)
    --     vim.cmd.colorscheme("tokyonight-storm")
    --     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --   end
    -- }
    {
        'rose-pine/neovim',
        lazy = false,
        opts = {
            disable_background = true,
            disable_float_background = true
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
            vim.cmd.colorscheme('rose-pine')
        end
    }
}

---@diagnostic disable: missing-fields
return {
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            local comment = require("Comment")
            local ts_comment = require("ts_context_commentstring.integrations.comment_nvim")
            comment.setup({
                pre_hook = ts_comment.create_pre_hook(),
            })
        end,
    },
}

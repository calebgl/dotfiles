return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    opts = {
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<c-s>"] = "delete_buffer",
                    },
                    n = {
                        ["d"] = "delete_buffer",
                    },
                },
            },
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>" },
        { "<leader>fh", "<cmd>Telescope find_files hidden=true no-ignore=true<cr>" },
        { "<leader>fs", "<cmd>Telescope live_grep<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>" },
        { "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
        { "<leader>f:", "<cmd>Telescope command_history<cr>" },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        pcall(telescope.load_extension, "fzf")
    end,
}

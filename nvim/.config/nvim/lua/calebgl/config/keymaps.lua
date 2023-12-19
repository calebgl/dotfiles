local keymap = vim.keymap

keymap.set("n", "<leader>e", vim.cmd.Ex)

keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "J", "mzJ`z")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

keymap.set("n", "Q", "<nop>")

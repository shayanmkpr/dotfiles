-- lua/shayan/keymaps.lua
vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>x", ":q!<CR>")

keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")

keymap("n", "<leader>vv", "<C-w>w")
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap("n", "<leader>o", "<cmd>Outline<CR>")

keymap("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap("v", ">", ">gv", { desc = "Indent right and keep selection" })

keymap("n", "<leader>vs", "<cmd>vsplit<CR><cmd>Telescope find_files<CR>")
keymap("n", "<leader>r", "<cmd>reg<CR>")

-- Thank the prime not me.
keymap("n", "<leader>re", "oif err != nil {<CR>}<ESC>O")


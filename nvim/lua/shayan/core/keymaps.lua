-- lua/shayan/keymaps.lua
vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")

keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")

keymap("n", "<leader>vv", "<C-w>w")
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

keymap("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Better window navigation
keymap("n", "<leader>vs", "<cmd>vsplit<CR><cmd>Telescope find_files<CR>")
keymap("n", "<leader>r", "<cmd>reg<CR>")

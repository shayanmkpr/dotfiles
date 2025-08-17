-- lua/shayan/keymaps.lua
vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>r", "<cmd>reg<CR>")
keymap("n", "<leader>vs", "<cmd>vsplit<CR><cmd>Telescope find_files<CR>")
keymap("n", "<leader>vv", "<C-w>w")
keymap("v", "<leader>y", '"*y')
keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>e", ":<cmd>Explore<CR>")
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")

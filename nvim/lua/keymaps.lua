vim.g.mapleader = " "
local keymap = vim.keymap.set

keymap("n", "<leader>a", ":AvanteChat<CR>")
keymap("n", "<leader>A", ":AvanteChatNew<CR>")

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

keymap("n", "<leader>g", ":bnext<CR>")
keymap("n", "<leader>s", ":bprevious<CR>")

-- Thank the prime not me.
keymap("n", "<leader>re", "oif err != nil {<CR>}<ESC>O")

-- hugging faces llm nvim
-- keymap("i", "<C-Space>", require("llm").suggest, { desc = "Trigger AI complete" })

-- codium
keymap("i", "<leader><tab>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

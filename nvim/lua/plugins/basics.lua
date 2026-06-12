return {
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim"},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		init = function()
			vim.g.codeium_disable_bindings = 1
		end,
		-- config = function()
		-- 	-- use tab to Accept
		-- 	vim.keymap.set("i", "<leader><tab>", function()
		-- 		return vim.fn["codeium#Accept"]()
		-- 	end, { expr = true, silent = true })
		-- end,
	},
}

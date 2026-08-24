return {
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				file_ignore_patterns = {},
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
				},
			},
		},
	},
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

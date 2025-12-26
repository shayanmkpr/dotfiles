return {
	{ "nvim-lua/plenary.nvim" },
	-- Telescope
	{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
	-- Codeium
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		init = function()
			vim.g.codeium_disable_bindings = 1
		end,
		config = function()
			vim.keymap.set("i", "<F6>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
		end,
	},
}

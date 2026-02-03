return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = { enable = true },
	config = function()
		require("treesitter-context").setup({
			enable = true,
			line_numbers = false,
			mode = "topline",
			separator = "_",
		})
	end,
}

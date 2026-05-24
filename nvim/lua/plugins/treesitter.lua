return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true, disable = { "markdown" } },
		-- highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"python",
			"matlab",
			"go",
			"json",
			"javascript",
			"typescript",
			"html",
			"css",
			"svelte",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"c",
			-- "markdown",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

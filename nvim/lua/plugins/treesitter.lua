return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {},
		},
	},
	opts = {
		highlight = { enable = true },
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
			"markdown",
			"markdown_inline",
			"svelte",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"c",
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

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"python", "matlab", "go", "json", "java", "javascript",
			"typescript", "html", "css", "svelte", "bash", "lua",
			"vim", "dockerfile", "gitignore", "query", "c",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = vim.tbl_filter(function(ft) return ft ~= "markdown" end, opts.ensure_installed),
			callback = function(args) pcall(vim.treesitter.start, args.buf) end,
		})
		vim.g.ts_indent_enable = true
	end,
}

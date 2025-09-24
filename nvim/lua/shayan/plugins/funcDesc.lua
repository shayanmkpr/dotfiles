return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = { enable = true },
	config = function()
		require'treesitter-context'.setup{
		  enable = true,
		  line_numbers = false,
		  mode = 'topline',  -- Show context at the top of the window
		  -- max_lines = 1,  -- Show only 1 line of context
		  separator = '_',  -- Separator between context and current line
		}
	end,

}

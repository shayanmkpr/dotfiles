return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
	"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
		  view = { width = 30, side = "left" },
		  renderer = { icons = { show = { file = true, folder = true } } },
		  actions = { open_file = { quit_on_open = true } }
		})
  end,
}

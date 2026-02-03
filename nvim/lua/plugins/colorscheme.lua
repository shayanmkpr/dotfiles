return {
	"https://gitlab.com/motaz-shokry/gruvbox.nvim",
	name = "gruvbox",
	config = function()
		require("gruvbox").setup({
			styles = {
				italic = true,
				transparency = false,
				bold = true,
			},
		})
		vim.cmd("colorscheme gruvbox-hard")
	end,
}

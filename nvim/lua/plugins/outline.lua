return {
	"hedyhli/outline.nvim",
	config = function()
		require("outline").setup({
			outline_window = {
			relative_width = false,
			width = 50,
			wrap = true,
			},
		})
	end,
}

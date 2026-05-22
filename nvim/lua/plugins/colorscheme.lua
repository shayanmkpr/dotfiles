return {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("monokai-pro").setup({
			transparent_background = false,
			devicons = true,
			styles = {
				comment = { italic = true },
				keyword = { italic = true },
				type = { italic = true },
				storageclass = { italic = true },
				structure = { italic = true },
				parameter = { italic = true },
				annotation = { italic = true },
				tag_attribute = { italic = true },
			},
			filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
			day_night = {
				enable = false,
				day_filter = "ristretto",
				night_filter = "machine",
			},
		})
		vim.cmd.colorscheme("monokai-pro")
	end,
}

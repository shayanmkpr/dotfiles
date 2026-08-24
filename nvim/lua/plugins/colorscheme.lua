-- return {
-- 	"loctvl842/monokai-pro.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("monokai-pro").setup({
-- 			transparent_background = true,
-- 			devicons = true,
-- 			styles = {
-- 				comment = { italic = true },
-- 				keyword = { italic = true },
-- 				type = { italic = true },
-- 				storageclass = { italic = false },
-- 				structure = { italic = true },
-- 				parameter = { italic = true },
-- 				annotation = { italic = true },
-- 				tag_attribute = { italic = true },
-- 			},
-- 			filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
-- 		})
-- 		vim.cmd.colorscheme("monokai-pro")
-- 	end,
-- }


return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,

		config = function()
			require("rose-pine").setup({
				variant = "main", -- main | moon | dawn
				dark_variant = "main",
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,
				terminal_colors = true,
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
			})

			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
}


-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 			background = { light = "latte", dark = "mocha" },
-- 			transparent_background = true,
-- 			show_end_of_buffer = false,
-- 			term_colors = false,
-- 			dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
-- 			styles = {
-- 				comments = { "italic"},
-- 				conditionals = {},
-- 				loops = {},
-- 				functions = {"italic"},
-- 				keywords = {},
-- 				strings = {},
-- 				variables = {},
-- 				numbers = {"italic" },
-- 				booleans = {},
-- 				properties = {},
-- 				types = {"italic" },
-- 				operators = {},
-- 			},
-- 			default_integrations = true,
-- 			integrations = {
-- 				cmp = true,
-- 				gitsigns = true,
-- 				nvimtree = true,
-- 				treesitter = true,
-- 				notify = false,
-- 				mini = { enabled = true, indentscope_color = "" },
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme catppuccin")
-- 	end,
-- }

-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("gruvbox").setup({
-- 			transparent_mode = true,
-- 			undercurl = true,
-- 			underline = true,
-- 			bold = true,
-- 			italic = {
-- 				strings = true,
-- 				emphasis = true,
-- 				comments = true,
-- 				operators = true,
-- 				folds = true,
-- 			},
-- 			strikethrough = true,
-- 			invert_selection = false,
-- 			invert_signs = false,
-- 			invert_tabline = false,
-- 			invert_intend_guides = false,
-- 			inverse = true,
-- 			palette_overrides = {},
-- 			overrides = {},
-- 			dim_inactive = false,
-- 			component_style = "default", -- default | minimal | original
-- 			lualine_bold = false,
-- 		})
--
-- 		vim.cmd("colorscheme gruvbox")
-- 	end,
-- }

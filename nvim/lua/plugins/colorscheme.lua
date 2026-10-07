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
-- 			filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
-- 		})
-- 		vim.cmd.colorscheme("monokai-pro")
-- 	end,
-- }


-- return {
-- 	{
-- 		"rose-pine/neovim",
-- 		name = "rose-pine",
-- 		lazy = false,
-- 		priority = 1000,
--
-- 		config = function()
-- 			require("rose-pine").setup({
-- 				variant = "main", -- main | moon | dawn
-- 				dark_variant = "main",
-- 				disable_background = false,
-- 				disable_float_background = false,
-- 				disable_italics = false,
-- 				terminal_colors = true,
-- 				styles = {
-- 					bold = true,
-- 					italic = true,
-- 					transparency = true,
-- 				},
-- 			})
--
-- 			vim.cmd("colorscheme rose-pine")
-- 		end,
-- 	},
-- }

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

return {
	"sainnhe/gruvbox-material",
	priority = 1000,

	config = function()
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "material" -- "material" | "mix" | "original"
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_transparent_background = 0
		vim.g.gruvbox_material_colors_override = {
			bg0 = { "#171717", "234" },
			-- 	bg2 = { "#171717", "235" },
			-- 	bg3 = { "#171717", "235" },
		}
		vim.cmd("colorscheme gruvbox-material")
		vim.cmd([[
			highlight Keyword gui=italic
			highlight Function gui=italic
			highlight Type gui=italic
			highlight Comment gui=italic
			highlight Operator gui=italic
			highlight Constant gui=italic
			highlight String gui=italic
		]])
	end,
}

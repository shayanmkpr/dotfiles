-- return {
-- 	"loctvl842/monokai-pro.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("monokai-pro").setup({
-- 			transparent_background = false,
-- 			devicons = true,
-- 			styles = {
-- 				comment = { italic = true },
-- 				keyword = { italic = true },
-- 				type = { italic = true },
-- 				storageclass = { italic = true },
-- 				structure = { italic = true },
-- 				parameter = { italic = true },
-- 				annotation = { italic = true },
-- 				tag_attribute = { italic = true },
-- 			},
-- 			filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
-- 		})
-- 		vim.cmd.colorscheme("monokai-pro-octagon")
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
				variant = "moon", -- main | moon | dawn

				dark_variant = "moon",

				disable_background = false,
				disable_float_background = false,
				disable_italics = false,

				terminal_colors = true,

				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},

				highlight_groups = {
					-- Editor
					CursorLine = { bg = "highlight_low" },
					CursorLineNr = { fg = "gold", bold = true },

					LineNr = { fg = "muted" },

					Visual = { bg = "gold" },

					Search = {
						bg = "gold",
						fg = "base",
					},

					IncSearch = {
						bg = "rose",
						fg = "base",
					},

					MatchParen = {
						fg = "iris",
						bold = true,
					},

					-- Floating windows
					NormalFloat = { bg = "surface" },

					FloatBorder = {
						fg = "highlight_high",
						bg = "surface",
					},

					-- Telescope
					TelescopeNormal = { bg = "base" },

					TelescopeBorder = {
						fg = "overlay",
						bg = "base",
					},

					TelescopePromptNormal = {
						bg = "surface",
					},

					TelescopePromptBorder = {
						fg = "iris",
						bg = "surface",
					},

					TelescopeSelection = {
						bg = "highlight_med",
					},

					-- Completion menu
					Pmenu = {
						bg = "surface",
					},

					PmenuSel = {
						bg = "highlight_med",
					},

					-- Diagnostics
					DiagnosticError = { fg = "love" },
					DiagnosticWarn = { fg = "gold" },
					DiagnosticInfo = { fg = "foam" },
					DiagnosticHint = { fg = "iris" },

					-- Git
					GitSignsAdd = { fg = "foam" },
					GitSignsChange = { fg = "rose" },
					GitSignsDelete = { fg = "love" },
				},
			})

			vim.cmd("colorscheme rose-pine")
		end,
	},
}

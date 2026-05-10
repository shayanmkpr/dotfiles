-- return {
-- 	"https://gitlab.com/motaz-shokry/gruvbox.nvim",
-- 	name = "gruvbox",
-- 	config = function()
-- 		require("gruvbox").setup({
-- 			styles = {
-- 				italic = true,
-- 				transparency = false,
-- 				bold = true,
-- 			},
-- 		})
-- 		vim.cmd("colorscheme gruvbox-soft")
-- 	end,
-- }
--
-- return {
-- 	{
-- 		"dracula/vim",
-- 		name = "dracula",
-- 		lazy = false, -- load immediately
-- 		priority = 1000, -- make sure colorscheme is loaded first
-- 		config = function()
-- 			-- Dracula settings
-- 			vim.g.dracula_italic = 1 -- enable italics
-- 			vim.g.dracula_italic_comment = 1 -- italics for comments
-- 			vim.g.dracula_italic_keyword = 1 -- italics for keywords
-- 			vim.g.dracula_italic_function = 1 -- italics for function names
-- 			vim.g.dracula_italic_variable = 0 -- usually leave variables normal
-- 			vim.g.dracula_bold = 1 -- enable bold text
-- 			vim.g.dracula_underline = 1 -- enable underlines
-- 			vim.g.dracula_transparent_bg = 0 -- optional: 1 for transparent
-- 			vim.cmd("colorscheme dracula") -- apply colorscheme
--
-- 			-- Optional quirks
-- 			vim.cmd([[
--         hi Operator gui=italic
--         hi MatchParen gui=italic,bold
--       ]])
-- 		end,
-- 	},
-- }

-- return {
-- 	{
-- 		"sainnhe/everforest",
-- 		name = "everforest",
-- 		lazy = false,
-- 		priority = 1000,
--
-- 		config = function()
-- 			-- Background style
-- 			vim.g.everforest_background = "hard" -- soft | medium | hard
--
-- 			-- Enable better contrast
-- 			vim.g.everforest_enable_italic = 0
-- 			vim.g.everforest_disable_italic_comment = 0
--
-- 			-- UI options
-- 			vim.g.everforest_transparent_background = 0
-- 			vim.g.everforest_better_performance = 1
--
-- 			-- Optional tweaks
-- 			vim.g.everforest_cursor = "auto"
-- 			vim.g.everforest_ui_contrast = "high"
--
-- 			-- Apply colorscheme
-- 			vim.cmd("colorscheme everforest")
--
-- 			-- Optional highlight tweaks (like your Dracula quirks)
-- 			vim.cmd([[
-- 				hi Operator gui=italic
-- 				hi MatchParen gui=italic,bold
-- 			]])
-- 		end,
-- 	},
-- }

-- return {
-- 	{
-- 		"rose-pine/neovim",
-- 		name = "rose-pine",
-- 		lazy = false, -- load immediately
-- 		priority = 1000, -- ensure colorscheme loads first
--
-- 		config = function()
-- 			vim.g.rose_pine_variant = "main"
-- 			vim.g.rose_pine_disable_background = false
-- 			vim.g.rose_pine_italics = true -- affects comments, keywords, operators
-- 			vim.g.rose_pine_bold_keywords = true -- set true if you want bold keywords
-- 			vim.g.rose_pine_disable_italic_comment = false
-- 			vim.g.rose_pine_highlight_groups = true -- allows colorscheme to set treesitter, LSP, and UI highlights
-- 			vim.cmd("colorscheme rose-pine")
-- 		end,
-- 	},
-- }

return {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("monokai-pro").setup()
		vim.cmd.colorscheme("monokai-pro")
	end,
}

return {
	{
		"nvim-lua/plenary.nvim"
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {file_ignore_patterns = {},},
			pickers = {find_files = {hidden = true,no_ignore = true,},},
		},
	},
	{
		'Bekaboo/dropbar.nvim'
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = { width = 50 },
				renderer = { icons = { show = { file = true, folder = true } } },
				update_focused_file = { enable = true },
				actions = { open_file = { quit_on_open = true } },})end,
	},
	{
	  "ThePrimeagen/harpoon",
	  -- branch = "harpoon2",
	  keys = {
		{"<leader>ha",function() require("harpoon.mark").add_file() end,},
		{"<leader>hh",function()require("harpoon.ui").toggle_quick_menu() end,},
		{"<leader>1",function() require("harpoon.ui").nav_file(1) end,},
		{"<leader>2",function() require("harpoon.ui").nav_file(2) end,},
		{"<leader>3",function() require("harpoon.ui").nav_file(3) end,},
		{"<leader>4",function() require("harpoon.ui").nav_file(4) end,},
		{"<leader>5",function() require("harpoon.ui").nav_file(5) end,},
		{"<leader>6",function() require("harpoon.ui").nav_file(6) end,},
	  },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				map("n", "<leader>hu", gs.prev_hunk, "Preview hunk")
				map("n", "<leader>hl", gs.next_hunk, "Preview hunk")
				map("n", "<leader>hd", gs.diffthis, "Diff this")

				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame line")

			end,
		},
	},
	{
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
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	opts = {
	-- 		indent = { char = "▏" },
	-- 		scope = { enabled = true },
	-- 	},
	-- }
	-- {
	--   'Exafunction/windsurf.vim',
	--   event = 'BufEnter'
	-- }
		-- config = function()
		-- 	-- use tab to Accept
		-- 	vim.keymap.set("i", "<leader><tab>", function()
		-- 		return vim.fn["codeium#Accept"]()
		-- 	end, { expr = true, silent = true })
		-- end,
}

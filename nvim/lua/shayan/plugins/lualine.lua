return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function recording_status()
			local reg = vim.fn.reg_recording()
			if reg == "" then
				return ""
			end
			return "@" .. reg
		end

		local function search_count()
			local sc = vim.fn.searchcount()
			if sc.total == 0 then
				return ""
			end
			return "󰍉 " .. sc.current .. "/" .. sc.total
		end

		local function parent_and_filename()
			local filepath = vim.fn.expand("%:p")
			if filepath == "" then
				return "[No Name]"
			end

			local parent = vim.fn.fnamemodify(filepath, ":h:t")
			local filename = vim.fn.fnamemodify(filepath, ":t")

			return parent .. "/" .. filename
		end

		local function penguin()
			return "󰻀Ψ"
		end

		require("lualine").setup({
			options = {
				theme = "everforest",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { parent_and_filename },
				lualine_b = { "branch", "diff" },
				lualine_c = { "diagnostics" },
				lualine_y = { recording_status, search_count },
				lualine_z = { penguin },
			},
		})
	end,
}

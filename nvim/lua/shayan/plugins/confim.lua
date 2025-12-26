return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype

			-- Only enable for these filetypes
			local allowed = {
				go = false,
				lua = true,
				python = true,
				javascript = true,
				typescript = true,
			}

			if not allowed[ft] then
				return
			end

			return {
				lsp_fallback = true,
				timeout_ms = 500,
			}
		end,

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
	},
}

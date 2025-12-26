return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		require("outline").setup({
			--    width = 50,
			--    relative_width = false,
			-- wrap = true
		})
	end,
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Configure diagnostic display
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Set diagnostic signs
		local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		for type, icon in pairs(signs) do
			vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
		end

		-- LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local map = vim.keymap.set
				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				map("n", "gD", vim.lsp.buf.declaration, opts)
				-- map("n", "gi", function()
				-- 	vim.lsp.buf.implementation({
				-- 		on_list = function(options)
				-- 			local max = 200
				-- 			if #options.items > max then
				-- 				local t = {}
				-- 				for i = 1, max do t[i] = options.items[i] end
				-- 				options.items = t
				-- 			end
				-- 			vim.fn.setqflist({}, " ", options)
				-- 			vim.cmd("Telescope quickfix")
				-- 		end,
				-- 	})
				-- end, opts)
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				map("n", "ga", "<cmd>Telescope lsp_references<CR>", opts)
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "<leader>d", vim.diagnostic.open_float, opts)
				map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				map("n", "[d", vim.diagnostic.goto_prev, opts)
				map("n", "]d", vim.diagnostic.goto_next, opts)
				map("n", "<leader>rs", ":LspRestart<CR>", opts)
				map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
				if vim.lsp.inlay_hint then
					vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
				end
			end,
		})

		-- Auto-format and organize imports for Go files
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
				for cid, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end
				vim.lsp.buf.format({ async = false })
			end,
		})

		-- Setup Mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"gopls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
			},
			handlers = {
				-- Default handler for all servers
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- Specific handler for lua_ls
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
								hint = { enable = false },
							},
						},
					})
				end,
				-- Specific handler for gopls
				["gopls"] = function()
					require("lspconfig").gopls.setup({
						capabilities = capabilities,
						cmd = { "gopls" },
						settings = {
							gopls = {
								analyses = {
									unusedparams = true,
									shadow = true,
								},
								staticcheck = true,
								gofumpt = true,
								semanticTokens = true,
							},
						},
					})
				end,
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
			},
		})
	end,
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    local lspconfig = require("lspconfig")
	-- local lspconfig = vim.lsp.config
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    -- Configure diagnostic display settings
    vim.diagnostic.config({
      virtual_text = true,  -- Show inline error messages
      signs = true,         -- Show gutter signs (even if icons are empty, this enables the column)
      underline = true,     -- Underline errors
      update_in_insert = false,  -- Don't update while typing
      severity_sort = true,
    })
    
    -- Set signs (you had empty icons; if you want visible ones, update the icons here, e.g., "" for Error)
    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
    end
    
    -- Autocmd for LspAttach (unchanged)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local map = vim.keymap.set
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
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
    
    -- Add auto-format and organize imports on save for Go files
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
    
    require("mason").setup()
    local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if mason_lspconfig_ok then
      mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "gopls" },  -- Added gopls for Mason management (optional but recommended)
      })
      -- Try to use setup_handlers if available
      if mason_lspconfig.setup_handlers then
        mason_lspconfig.setup_handlers({
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  completion = { callSnippet = "Replace" },
                },
              },
            })
          end,
          ["gopls"] = function()
            lspconfig.gopls.setup({
              capabilities = {
				capabilities,
					textDocument = {
						  diagnostic = { dynamicRegistration = true }
						}
							},
              cmd = { "gopls" },
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true,
                    shadow = true,  -- Added for better diagnostics
                  },
                  staticcheck = true,
                  gofumpt = true,  -- Optional: stricter formatting
                  semanticTokens = true,  -- For improved highlighting
                },
              },
            })
          end,
        })
      else
        -- Fallback to manual setup
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
            },
          },
        })
        lspconfig.gopls.setup({
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
      end
    else
      -- Mason-lspconfig not available, setup manually
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            completion = { callSnippet = "Replace" },
          },
        },
      })
      lspconfig.gopls.setup({
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
    end
  end,
}

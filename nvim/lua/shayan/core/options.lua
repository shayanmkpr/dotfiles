-- lua/shayan/options.lua
local opt = vim.opt

-- ============================================================================
-- DISPLAY & UI
-- ============================================================================
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.signcolumn = "yes"
opt.cmdheight = 0
opt.laststatus = 2
opt.background = "dark"
opt.scrolloff = 8

-- Netrw file explorer
vim.g.netrw_liststyle = 3

-- ============================================================================
-- INDENTATION & FORMATTING
-- ============================================================================
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true
opt.smartindent = true

-- ============================================================================
-- SEARCH & NAVIGATION
-- ============================================================================
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Show search matches as you type

-- ============================================================================
-- EDITING BEHAVIOR
-- ============================================================================
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.swapfile = false
opt.backup = false -- Disable backup files
opt.undofile = true -- Enable persistent undo
opt.undolevels = 1000
opt.timeoutlen = 300 -- Faster key sequence timeout
opt.updatetime = 250 -- Faster CursorHold events

-- ============================================================================
-- WINDOW SPLITS
-- ============================================================================
opt.splitright = true
opt.splitbelow = true

-- ============================================================================
-- SPELL CHECKING
-- ============================================================================
opt.spell = true
opt.spelllang = { "en_us" }

-- ============================================================================
-- PERFORMANCE
-- ============================================================================
opt.lazyredraw = true -- Don't redraw during macros
opt.ttyfast = true -- Faster terminal connection

-- ============================================================================
-- KEYMAPS
-- ============================================================================
local keymap = vim.keymap.set

-- Visual mode indenting (keep selection)
keymap("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Better navigation
keymap("n", "j", "gj", { desc = "Move down by visual line" })
keymap("n", "k", "gk", { desc = "Move up by visual line" })

-- Clear search highlights
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.cmd [[filetype plugin indent on]]

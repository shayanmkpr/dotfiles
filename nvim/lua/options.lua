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
vim.g.netrw_banner = 0
vim.g.netrw_sort_sequence = "[/]$,*" -- Sort dirs first
vim.o.fillchars = "eob: " -- Clean empty lines

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
opt.hlsearch = true
opt.incsearch = true

-- ============================================================================
-- EDITING BEHAVIOR
-- ============================================================================
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undolevels = 1000
opt.timeoutlen = 300
opt.updatetime = 250

-- ============================================================================
-- WINDOW SPLITS
-- ============================================================================
opt.splitright = true
opt.splitbelow = true

-- ============================================================================
-- SPELL CHECKING
-- ============================================================================
opt.spell = false
opt.spelllang = { "en_us" }

-- ============================================================================
-- PERFORMANCE
-- ============================================================================
vim.cmd([[filetype plugin indent on]])

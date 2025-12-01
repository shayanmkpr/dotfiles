return {
-- ===============================================================

    -- "folke/tokyonight.nvim",
    -- priority = 1000,
    -- config = function()
    --     require("tokyonight").setup({
    --         style = "night",
    --         styles = {
    --             comments = { italic = true },
    --             keywords = { italic = true },
    --             functions = { italic = true },
    --         },
    --         transparent = true
    --     })
    --
    --     vim.cmd("colorscheme tokyonight")
    -- end,

-- ===============================================================

    -- "EdenEast/nightfox.nvim",
    -- config = function()
    --     require("nightfox").setup({
    --         style = "nightfox",
    --         options = {
    --         transparent = true
    --         }
    --     })
    --     vim.cmd("colorscheme terafox")
    -- end

-- ===============================================================

    -- "rose-pine/neovim",
    -- config = function()
    --     require("rose-pine").setup({
    --         styles = {
    --             transparency = true,
    --             italic = true,
    --             bold = true
    --         }
    --     })
    --     vim.cmd("colorscheme rose-pine-moon")
    -- end,

-- ===============================================================

    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --     require("catppuccin").setup({
    --         flavour = "mocha",
    --         transparent_background = true,
    --         styles = {
    --             keywords = {"italic", "bold"},
    --             strings  = {"italic"},
    --             comments = {"italic", "bold"},
    --             numbers = {"bold"}
    --         }
    --     })
    --     vim.cmd("colorscheme catppuccin-mocha")
    -- end

-- ===============================================================

    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    config = function()
        require("gruvbox").setup({
            styles = {
                transparency = true
            }
        })
        vim.cmd("colorscheme gruvbox-hard")
    end

-- ===============================================================

    -- "rebelot/kanagawa.nvim",
    -- name = "kanagawa",
    -- config = function()
    --     require("kanagawa").setup({
    --         transparent = false
    --     })
    --     vim.cmd("colorscheme kanagawa-wave")
    -- end
}

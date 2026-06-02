return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "▏", -- less prominent than │
            highlight = "IblIndent",
        },
        scope = {
            enabled = true,
            highlight = "IblScope",
        },
    },
    config = function(_, opts)
        local hooks = require("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            -- Regular indent guides
            vim.api.nvim_set_hl(0, "IblIndent", {
                fg = "#3A4048",
                nocombine = true,
            })

            -- Current scope
            vim.api.nvim_set_hl(0, "IblScope", {
                fg = "#6C809A",
                nocombine = true,
                bold = false,
            })
        end)

        require("ibl").setup(opts)
    end,
}

return {
    "folke/flash.nvim",
    lazy = true,
    ---@type Flash.Config
    opts = {
        labels = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        label = {
            uppercase = false,
        },
        modes = {
            char = {
                -- to disable jump in normal f t F T
                enabled = false
                -- jump_labels = false
            }
        },
    },
    -- stylua: ignore
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash"
        },
        {
            "<leader>sf",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { forward = true, wrap = false, multi_window = false },
                    -- highlight = { backdrop = false },
                })
            end,
            desc = "Flash"
        },
        {
            "<leader>st",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { forward = false, wrap = false, multi_window = false },
                    -- highlight = { backdrop = false },
                })
            end,
            desc = "Flash"
        },
        { "<leader>S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r",         mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
        {
            "R",
            mode = { "o", "x" },
            function() require("flash").treesitter_search() end,
            desc =
            "Treesitter Search"
        },
        {
            "<c-s>",
            mode = { "c" },
            function() require("flash").toggle() end,
            desc =
            "Toggle Flash Search"
        },
    },
}

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>ks", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
        { "<leader>kw", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<leader>ka", function() Snacks.picker() end,         desc = "Select pickers" },
    },
    opts = {
        scratch = {
        },
        picker = {
        },
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    }
}

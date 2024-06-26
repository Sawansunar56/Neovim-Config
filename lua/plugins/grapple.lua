return {
    "cbochs/grapple.nvim",
    opts = {
        scope = "git", -- also try out "git_branch"
        icons = true,
        quick_select = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
        { "<leader>gM", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
        { "<leader>gm", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
        { "<leader>gn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
        { "<leader>gp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    },
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
}

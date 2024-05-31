return {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    keys = {
        {
            "[t",
            function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end,
            desc = "jump to context"
        }
    },
    opts = {
        max_lines = 5,
    }
}

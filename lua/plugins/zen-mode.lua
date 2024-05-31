return {
    "folke/zen-mode.nvim",
    lazy = true,
    keys = {
        { "<leader>zn", function()
            require("zen-mode").toggle({
                window = {
                    width = 100
                }
            })
        end, desc = "toggle zen mode"}
    },
    opts = {
        window = {
            options = {
                linebreak = true,
                wrap = true
            }
        }
    }
}

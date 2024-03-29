return {
    "gbprod/yanky.nvim",
    -- event = "VeryLazy",
    lazy = true,
    enabled = function() return jit.os == "Linux" end,
    keys = {
        { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
        {
            "<leader>yk",
            "<cmd>Telescope yank_history<cr>",
            desc = "Call yank History",
        },
        {
            "p",
            "<Plug>(YankyPutAfter)",
            mode = { "n", "x" },
            desc = "Yanky Put After",
        },
        {
            "P",
            "<Plug>(YankyPutBefore)",
            mode = { "n", "x" },
            desc = "Yanky Put Before"
        },
        {
            "gp",
            "<Plug>(YankyGPutAfter)",
            mode = { "n", "x" },
            desc = "Yanky GPut After",
        },
        {
            "gP",
            "<Plug>(YankyGPutBefore)",
            mode = { "n", "x" },
            desc = "Yanky GPut After",
        },
        -- { ">p", "<Plug>(YankyPutIndentAfterShiftRight)",  desc = " Yanky Put " },
        -- { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = " Yanky Put " },
        -- { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = " Yanky Put " },
        -- { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = " Yanky Put " },
        --
        -- { "=p", "<Plug>(YankyPutAfterFilter)",            desc = " Yanky Put " },
        -- { "=P", "<Plug>(YankyPutBeforeFilter)",           desc = " Yanky Put " },
    },
    config = function()
        local utils = require("yanky.utils")
        local mapping = require("yanky.telescope.mapping")
        require("yanky").setup({
            ring = {
                history_length = 256,
                storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
            },
            highlight = {
                on_put = false,
                on_yank = false,
                timer = 100,
            },
            picker = {
                telescope = {
                    use_default_mappings = false,
                    mappings = {
                        default = mapping.put("p"),
                        i = {
                            ["<c-j>"] = mapping.put("p"),
                            ["<c-k>"] = mapping.put("P"),
                            ["<c-x>"] = mapping.delete(),
                            ["<c-r>"] = mapping.set_register(utils.get_default_register()),
                        },
                        n = {
                            p = mapping.put("p"),
                            P = mapping.put("P"),
                            d = mapping.delete(),
                            r = mapping.set_register(utils.get_default_register())
                        },
                    }
                }
            }
        })
        require("telescope").load_extension("yank_history")
    end,
}

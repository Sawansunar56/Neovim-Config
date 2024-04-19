return {
    "mfussenegger/nvim-treehopper",
    event = "VeryLazy",
    config = function()
        vim.keymap.set({ "o" }, "m", function()
            require("tsht").nodes()
        end, { noremap = false, expr = false, silent = true })
        vim.keymap.set({ "x" }, "m", ":lua require('tsht').nodes()<CR>", { noremap = true, expr = false, silent = true })
    end,
}

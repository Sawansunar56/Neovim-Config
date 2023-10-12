return {
    "saccarosium/neomarks",
    event = "VeryLazy",
    config = function()
        local neomarks = require("neomarks")
        neomarks.setup()

        vim.keymap.set("n", "<leader>nma", function() neomarks.mark_file() end, { desc = "add file to neomarks" })
        vim.keymap.set("n", "<leader>nme", function() neomarks.menu_toggle() end, { desc = "toggle menu to neomarks" })
        vim.keymap.set("n", "<leader>nmj", ":lua require('neomarks').jump_to()<Left>",
            { desc = "jump to index to neomarks" })
    end
}

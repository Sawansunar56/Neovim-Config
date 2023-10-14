return {
    "saccarosium/neomarks",
    event = "VeryLazy",
    config = function()
        local neomarks = require("neomarks")
        neomarks.setup()

        vim.keymap.set("n", "<leader>na", function() neomarks.mark_file() end, { desc = "add file to neomarks" })
        vim.keymap.set("n", "<leader>ne", function() neomarks.menu_toggle() end, { desc = "toggle menu to neomarks" })
        vim.keymap.set("n", "<leader>nn", ":lua require('neomarks').jump_to(1)<cr>",
            { desc = "jump to index to neomarks" })
        vim.keymap.set("n", "<leader>nm", ":lua require('neomarks').jump_to(2)<cr>",
            { desc = "jump to index to neomarks" })
        vim.keymap.set("n", "<leader>ns", ":lua require('neomarks').jump_to(3)<cr>",
            { desc = "jump to index to neomarks" })
        vim.keymap.set("n", "<leader>nt", ":lua require('neomarks').jump_to(4)<cr>",
            { desc = "jump to index to neomarks" })
    end
}

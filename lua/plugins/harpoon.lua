return {
    'theprimeagen/harpoon',
    event = "VeryLazy",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local map = vim.keymap.set

        map("n", "<leader>a", mark.add_file)
        map("n", "<C-e>", ui.toggle_quick_menu)

        map("n", "<C-n>", function() ui.nav_file(1) end)
        map("n", "<C-m>", function() ui.nav_file(2) end)
        map("n", "<C-s>", function() ui.nav_file(3) end)
        map("n", "<C-t>", function() ui.nav_file(4) end)
        map("n", "<leader>1", function() ui.nav_file(5) end)
        map("n", "<leader>2", function() ui.nav_file(6) end)
        map("n", "<leader>3", function() ui.nav_file(7) end)
        map("n", "<leader>4", function() ui.nav_file(8) end)
        map("n", "<leader>5", function() ui.nav_file(9) end)
        map("n", "<leader>6", function() ui.nav_file(10) end)

        map("n", "<A-n>", function() ui.nav_next() end)
        map("n", "<A-p>", function() ui.nav_prev() end)
    end,
}

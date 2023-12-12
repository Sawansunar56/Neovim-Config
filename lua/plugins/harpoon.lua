return {
    'theprimeagen/harpoon',
    event = "VeryLazy",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup(
        {
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = false,
                key = function()
                    return vim.loop.cwd()
                end
            }
        })
        local map = vim.keymap.set

        map("n", "<leader>a", function() harpoon:list():append() end)
        map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        map("n", "<C-n>", function()     harpoon:list():select(1) end)
        map("n", "<C-m>", function()     harpoon:list():select(2) end)
        map("n", "<C-s>", function()     harpoon:list():select(3) end)
        map("n", "<C-t>", function()     harpoon:list():select(4) end)
        map("n", "<leader>1", function() harpoon:list():select(5) end)
        map("n", "<leader>2", function() harpoon:list():select(6) end)
        map("n", "<leader>3", function() harpoon:list():select(7) end)
        map("n", "<leader>4", function() harpoon:list():select(8) end)
        map("n", "<leader>5", function() harpoon:list():select(9) end)
        map("n", "<leader>6", function() harpoon:list():select(10) end)

        map("n", "<A-n>", function() harpoon:list():next() end)
        map("n", "<A-p>", function() harpoon:list():prev() end)
    end,
    dependencies =  {
        'nvim-lua/plenary.nvim'
    }
}

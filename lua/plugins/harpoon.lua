return {
    'theprimeagen/harpoon',
    lazy = true,
    branch = "harpoon2",
    keys = {
        { "<leader>a", function() require('harpoon'):list():append() end,        { desc = "Harpoon file add" } },
        { "<C-e>",     function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, { desc = "Harpoon Menu" } },
        { "<C-n>",     function() require('harpoon'):list():select(1) end,       { desc = "Harpoon select 1" } },
        { "<C-m>",     function() require('harpoon'):list():select(2) end,       { desc = "Harpoon select 2" } },
        { "<C-s>",     function() require('harpoon'):list():select(3) end,       { desc = "Harpoon select 3" } },
        { "<C-t>",     function() require('harpoon'):list():select(4) end,       { desc = "Harpoon select 4" } },
        { "<A-n>",     function() require('harpoon'):list():next() end,          { desc = "Harpoon next file" } },
        { "<A-p>",     function() require('harpoon'):list():prev() end,          { desc = "Harpoon previous file" } },
    },
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
    end,
    dependencies = {
        'nvim-lua/plenary.nvim'
    }
}

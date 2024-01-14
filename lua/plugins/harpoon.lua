return {
    'theprimeagen/harpoon',
    lazy = true,
    branch = "harpoon2",
    keys = {
        { "<leader>a", function() require('harpoon'):list():append() end,                                 desc = "Harpoon main file add" },
        { "<C-e>",     function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "Harpoon main Menu" },
        { "<C-n>",     function() require('harpoon'):list():select(1) end,                                desc = "Harpoon main select 1" },
        { "<C-m>",     function() require('harpoon'):list():select(2) end,                                desc = "Harpoon main select 2" },
        { "<C-s>",     function() require('harpoon'):list():select(3) end,                                desc = "Harpoon main select 3" },
        { "<C-t>",     function() require('harpoon'):list():select(4) end,                                desc = "Harpoon main select 4" },
        { "<leader>1", function() require('harpoon'):list():select(5) end,                                desc = "Harpoon main select 5" },
        { "<leader>2", function() require('harpoon'):list():select(6) end,                                desc = "Harpoon main select 6" },
        { "<leader>3", function() require('harpoon'):list():select(7) end,                                desc = "Harpoon main select 7" },
        { "<leader>4", function() require('harpoon'):list():select(8) end,                                desc = "Harpoon main select 8" },
        { "<leader>5", function() require('harpoon'):list():select(9) end,                                desc = "Harpoon main select 9" },
        { "<A-n>",     function() require('harpoon'):list():next() end,                                   desc = "Harpoon next file" },
        { "<A-p>",     function() require('harpoon'):list():prev() end,                                   desc = "Harpoon previous file" },
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-t>", function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr })
            end,
        })
        harpoon:setup({
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

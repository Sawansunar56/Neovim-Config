return {
    'chentoast/marks.nvim',
    event = "VeryLazy",
    keys = {
        {
            '<leader>mat',
            ":MarksToggleSigns<cr>",
            mode = { 'n' },
            desc = "Marks toggle signs"
        },
        {
            '<leader>malb',
            ":MarksListBuf<cr>",
            mode = { 'n' },
            desc = "Marks open in localist in current buffers"
        },
        {
            '<leader>malg',
            ":MarksListGlobal<cr>",
            mode = { 'n' },
            desc = "Marks open in global localist in current buffers"
        },
        {
            '<leader>maqb',
            ":MarksQFListBuf<cr>",
            mode = { 'n' },
            desc = "Marks open in quicklist in current buffers"
        },
        {
            '<leader>maqg',
            ":MarksQFListGlobal<cr>",
            mode = { 'n' },
            desc = "Marks open global in quicklist in current buffers"
        },
    },
    config = function()
        require 'marks'.setup {
            default_mappings = true,
            builtin_marks = { ".", "<", ">", "^" },
            cyclic = true,
            force_write_shada = false,
            refresh_interval = 250,
            sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
            excluded_filetypes = {},
            bookmark_0 = {
                sign = "⚑",
                virt_text = "hello world",
                annotate = false,
            },
            mappings = {}
        }
    end,
}

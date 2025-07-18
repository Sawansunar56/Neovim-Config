return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
        {
            "<leader>mat",
            ":MarksToggleSigns<cr>",
            mode = { "n" },
            desc = "Marks toggle signs"
        },
        {
            "<leader>malb",
            ":MarksListBuf<cr>",
            mode = { "n" },
            desc = "Marks open in localist in current buffers"
        },
        {
            "<leader>malg",
            ":MarksListGlobal<cr>",
            mode = { "n" },
            desc = "Marks open in global localist in current buffers"
        },
        {
            "<leader>maqb",
            ":MarksQFListBuf<cr>",
            mode = { "n" },
            desc = "Marks open in quicklist in current buffers"
        },
        {
            "<leader>maqg",
            ":MarksQFListGlobal<cr>",
            mode = { "n" },
            desc = "Marks open global in quicklist in current buffers"
        },
    },
    config = function()
        -- mx              Set mark x
        -- m,              Set the next available alphabetical (lowercase) mark
        -- m;              Toggle the next available mark at the current line
        -- dmx             Delete mark x
        -- dm-             Delete all marks on the current line
        -- dm<space>       Delete all marks in the current buffer
        -- m]              Move to next mark
        -- m[              Move to previous mark
        -- m:              Preview mark. This will prompt you for a specific mark to
        --                 preview; press <cr> to preview the next mark.
        --
        -- m[0-9]          Add a bookmark from bookmark group[0-9].
        -- dm[0-9]         Delete all bookmarks from bookmark group[0-9].
        -- m}              Move to the next bookmark having the same type as the bookmark under
        --                 the cursor. Works across buffers.
        -- m{              Move to the previous bookmark having the same type as the bookmark under
        --                 the cursor. Works across buffers.
        -- dm=             Delete the bookmark under the cursor.
        require "marks".setup {
            default_mappings = true,
            signs = false,
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

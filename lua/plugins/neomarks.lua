return {
    "saccarosium/neomarks",
    lazy = true,
    config = true,
    keys = {
        {
            "<leader>na",
            mode = { "n" },
            function()
                require('neomarks').mark_file()
            end,
            desc = "add file to neomarks"
        },
        {
            "<leader>ne",
            mode = { "n" },
            function()
                require('neomarks').menu_toggle()
            end,
            desc = "toggle menu to neomarks"
        },
        {
            "<leader>nn",
            mode = { "n" },
            function()
                require('neomarks').jump_to(1)
            end,
            desc = "jump to index to neomarks",
        },
        {
            "<leader>nm",
            mode = { "n" },
            function()
                require('neomarks').jump_to(2)
            end,
            desc = "jump to index to neomarks"
        },
        {
            "<leader>ns",
            mode = { "n" },
            function()
                require('neomarks').jump_to(3)
            end,
            desc = "jump to index to neomarks"
        },
        {
            "<leader>nt",
            mode = { "n" },
            function()
                require('neomarks').jump_to(4)
            end,
            desc = "jump to index to neomarks"
        }
    },
}

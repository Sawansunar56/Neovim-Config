return {
    'Sawansunar56/Alter',
    --dir = "/home/sawansunar/projects/Alter/",
    keys = {
        { "<leader>af",  function() require('alter'):AddFile() end,             desc = "Alter add file" },
        { "<leader>ac",  function() require('alter'):ConnectFile() end,         desc = "Alter connect file" },
        { "<leader>ap",  function() require('alter'):PrintConnection() end,     desc = "Alter print alternate file" },
        { "<leader>aP",  function() require('alter'):PrintAll() end,            desc = "Alter all connected project files" },
        { "<leader>adc", function() require('alter'):DeleteConnection() end,    desc = "Alter delete connection of current file" },
        { "<leader>adf", function() require('alter'):ClearCurrentFile() end,    desc = "Alter Clear Current file from project" },
        { "<leader>adp", function() require('alter'):ClearCurrentProject() end, desc = "Alter Clear Current Project from table" },
        { "<leader>adt", function() require('alter'):ClearTable() end,          desc = "Alter Clear Entire Table" },
        { "<leader>ass", function() require('alter'):SaveConfig() end,          desc = "Alter Save Config to File" },
        { "<leader>ah",  function() require('alter'):Alternate() end,           desc = "Alter alternate file" },
        { "<leader>al",  function() require('alter'):InPlace() end,             desc = "Alter inplace c file" },
        { "<leader>aj",  function() require('alter'):Split(true) end,           desc = "Alter horizontal split file" },
        { "<leader>ak",  function() require('alter'):Split(false) end,          desc = "Alter vertical split file" },
    },
    lazy = true,
    config = function()
        require('alter'):setup({
            inPlace = {
                cpp = { "h", "hpp", "inl" },
                h = { "cpp", "c", "inl" },
                inl = { "h", "hpp", "cpp" },
                css = { "jsx" },
                jsx = { "css" },
                vert = { "frag" },
                frag = { "vert" },
            }
        })
    end
}

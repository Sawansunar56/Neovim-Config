return {
    'Sawansunar56/Alter',
    -- dir = "/home/sawan/projects/luaPlugin/alter/",
    keys = {
        { "<leader>af",  function() require('alter'):AddFile() end,             { desc = "Alter add file" } },
        { "<leader>ac",  function() require('alter'):ConnectFile() end,         { desc = "Alter connect file" } },
        { "<leader>ap",  function() require('alter'):PrintConnection() end,     { desc = "Alter print alternate file" } },
        { "<leader>aP",  function() require('alter'):PrintAll() end,            { desc = "Alter all connected project files" } },
        { "<leader>adc", function() require('alter'):DeleteConnection() end,    { desc = "Alter delete connection of current file" } },
        { "<leader>adf", function() require('alter'):ClearCurrentFile() end,    { desc = "Alter Clear Current file from project" } },
        { "<leader>adp", function() require('alter'):ClearCurrentProject() end, { desc = "Alter Clear Current Project from table" } },
        { "<leader>adt", function() require('alter'):ClearTable() end,          { desc = "Alter Clear Entire Table" } },
        { "<leader>ss",  function() require('alter'):SaveConfig() end,          { desc = "Alter Save Config to File" } },
        { "<C-b>",       function() require('alter'):Alternate() end,           { desc = "Alter alternate file" } },
    },
    lazy = true,
    config = function()
        require('alter'):setup()
    end
}

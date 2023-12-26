return {
    'Sawansunar56/Alter',
    -- dir = "/home/sawan/projects/luaPlugin/alter/",
    event = "VeryLazy",
    config = function()
        local alter = require('alter')
        alter:setup()
        local map = vim.keymap.set
        map("n", "<leader>af", function() alter:AddFile() end, { desc = "Alter add file" })
        map("n", "<leader>ac", function() alter:ConnectFile() end, { desc = "Alter connect file" })
        map("n", "<leader>ap", function() alter:PrintConnection() end, { desc = "Alter print alternate file" })
        map("n", "<leader>aP", function() alter:PrintAll() end, { desc = "Alter all connected project files" })
        map("n", "<leader>adc", function() alter:DeleteConnection() end, { desc = "Alter delete connection of current file" })
        map("n", "<leader>adf", function() alter:ClearCurrentFile() end, { desc = "Alter Clear Current file from project" })
        map("n", "<leader>adp", function() alter:ClearCurrentProject() end, { desc = "Alter Clear Current Project from table" })
        map("n", "<leader>adt", function() alter:ClearTable() end, { desc = "Alter Clear Entire Table" })
        map("n", "<leader>ss", function() alter:SaveConfig() end, { desc = "Alter Save Config to File" })
        map("n", "<C-b>", function() alter:Alternate() end, { desc = "Alter alternate file" })
    end
}

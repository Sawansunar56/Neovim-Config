return {
    dir = "/home/sawan/projects/luaPlugin/alter/",
    event = "VeryLazy",
    config = function()
        local alter = require('alter')
        alter:setup()
        local map = vim.keymap.set
        map("n", "<leader>af", function() alter:AddFile() end, { desc = "Alter add file" })
        map("n", "<leader>ac", function() alter:ConnectFile() end, { desc = "Alter connect file" })
        map("n", "<leader>ap", function() alter:PrintConnection() end, { desc = "Alter print alternate file" })
        map("n", "<leader>aP", function() alter:PrintAll() end, { desc = "Alter all connected project files" })
        map("n", "<leader>ad", function() alter:DeleteConnetion() end, { desc = "Alter delete connection of current file" })
        map("n", "<C-b>", function() alter:Alternate() end, { desc = "Alter alternate file" })
    end
}

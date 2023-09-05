return {
  'theprimeagen/harpoon',
  event = "VeryLazy",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local map = vim.keymap.set

    map("n", "<leader>a", mark.add_file)
    map("n", "<C-e>", ui.toggle_quick_menu)

    map("n", "<C-n>", function() ui.nav_file(1) end)
    map("n", "<C-m>", function() ui.nav_file(2) end)
    map("n", "<C-s>", function() ui.nav_file(3) end)
    map("n", "<C-t>", function() ui.nav_file(4) end)

    map("n", "<A-]>", function() ui.nav_next() end)
    map("n", "<A-[>", function() ui.nav_prev() end)
  end,
}

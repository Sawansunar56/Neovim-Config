return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = "VeryLazy",
  config = function()
    -- Select textobjects
    vim.keymap.set({ "x", "o" }, "as", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@statement.outer", "textobjects")
    end, { desc = "Select outer statement" })

    -- Swap next
    vim.keymap.set("n", "<leader>rna", function()
      require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
    end, { desc = "Swap next parameter" })
    vim.keymap.set("n", "<leader>rn:", function()
      require("nvim-treesitter-textobjects.swap").swap_next("@property.outer")
    end, { desc = "Swap next property" })
    vim.keymap.set("n", "<leader>rnm", function()
      require("nvim-treesitter-textobjects.swap").swap_next("@function.outer")
    end, { desc = "Swap next function" })

    -- Swap previous
    vim.keymap.set("n", "<leader>rpa", function()
      require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
    end, { desc = "Swap prev parameter" })


    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "]l", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[l", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
    end)
  end,
}

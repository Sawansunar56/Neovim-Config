return {
  "nvim-telescope/telescope-frecency.nvim",
  keys = {
    { "<leader>fr", ":Telescope frecency<cr>", desc = "frecency" }
  },
  lazy = true,
  config = function()
    require("telescope").load_extension "frecency"
  end,
  dependencies = { "kkharji/sqlite.lua" },
}

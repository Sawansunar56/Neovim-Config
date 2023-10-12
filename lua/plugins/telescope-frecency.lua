return {
  "nvim-telescope/telescope-frecency.nvim",
  keys = {
    { "<leader>fx", ":Telescope frecency theme=dropdown<cr>", desc = "frecency" },
    { "<leader>fr", ":Telescope frecency workspace=CWD theme=dropdown<cr>", desc = "frecency cwd" }
  },
  lazy = true,
  config = function()
    require("telescope").load_extension "frecency"
  end,
}

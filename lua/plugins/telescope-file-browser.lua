return {
  "nvim-telescope/telescope-file-browser.nvim",
  event = "VeryLazy",
  keys = {
    { '<leader>ph', ":Telescope file_browser<cr>",                               desc = "Telescope project file browser" },
    { '<leader>pt', ":Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope current file browser" },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}

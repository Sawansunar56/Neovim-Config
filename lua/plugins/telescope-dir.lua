return {
  "princejoogie/dir-telescope.nvim",
  lazy = true,
  keys = {
    {
      "<leader>fd", ":FileInDirectory<cr>", desc = "telescope directory specific live grep"
    },
    {
      "<leader>pd", ":GrepInDirectory<cr>", desc = "telescope directory specific find files"
    },
  },
  config = function()
    require("dir-telescope").setup({
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
      follow_symlinks = false,
    })
    require("telescope").load_extension("dir")
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  }
}

return {
  'stevearc/oil.nvim',
  lazy = true,
  opts = {},
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
}

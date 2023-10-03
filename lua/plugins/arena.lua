return {
  "dzfrias/arena.nvim",
  keys = {
    {"<leader>ar", "<cmd>ArenaToggle<cr>", desc = "frecency arena" }
  },
  event = "BufWinEnter",
  -- Calls `.setup()` automatically
  config = true,
}

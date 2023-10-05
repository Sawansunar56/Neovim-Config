return {
  "dzfrias/arena.nvim",
  keys = {
    {"<C-q>", "<cmd>ArenaToggle<cr>", desc = "frecency arena" }
  },
  event = "BufWinEnter",
  -- Calls `.setup()` automatically
  config = true,
}

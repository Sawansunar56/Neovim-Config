return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>ks", function() Snacks.scratch() end,              desc = "Toggle Scratch Buffer" },
    { "<leader>kw", function() Snacks.scratch.select() end,       desc = "Snacks Scratch Buffer" },
    { "<leader>ka", function() Snacks.picker() end,               desc = "Snacks pickers" },
    { "<leader>kt", function() Snacks.picker.todo_comments() end, desc = "Snacks Select todo comments" },
    { "<leader>kr", function() Snacks.picker.resume() end,        desc = "Snacks Resume" },
  },
  opts = {
    scratch = {
    },
    picker = {
    },
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    scope = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  }
}

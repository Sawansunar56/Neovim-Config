return {
  "gbprod/yanky.nvim",
  enabled = false,
  dependencies = {
    -- { "kkharji/sqlite.lua" },
    { "folke/snacks.nvim" }
  },
  opts = {
    ring = { storage = "memory" },
  },
  keys = {
    { "<leader>yo", "<cmd>YankyRingHistory<cr>",              mode = { "n", "x" },                                      desc = "Yanky Open Yank History" },
    {
      "<leader>ys",
      function()
        Snacks.picker.yanky()
      end,
      mode = { "n", "x" },
      desc = "Yanky Open Snacks"
    },
    { "<leader>yy", "<Plug>(YankyYank)",                      mode = { "n", "x" },                                      desc = "Yanky Yank text" },
    { "<leader>yp", "<Plug>(YankyPutAfter)",                  mode = { "n", "x" },                                      desc = "Yanky Put yanked text after cursor" },
    { "<leader>yP", "<Plug>(YankyPutBefore)",                 mode = { "n", "x" },                                      desc = "Yanky Put yanked text before cursor" },
    { "<leader>yg", "<Plug>(YankyGPutAfter)",                 mode = { "n", "x" },                                      desc = "Yanky Put yanked text after cursor and leave cursor after" },
    { "<leader>yG", "<Plug>(YankyGPutBefore)",                mode = { "n", "x" },                                      desc = "Yanky Put yanked text before cursor and leave cursor after" },
    { "<leader>ym", "<Plug>(YankyPreviousEntry)",             desc = "Yanky Select previous entry through yank history" },
    { "<leader>yn", "<Plug>(YankyNextEntry)",                 desc = "Yanky Select next entry through yank history" },
    { "]w",         "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Yanky Put indented after cursor (linewise)" },
    { "[w",         "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Yanky Put indented before cursor (linewise)" },
    { "]W",         "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Yanky Put indented after cursor (linewise)" },
    { "[W",         "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Yanky Put indented before cursor (linewise)" },
    { ">w",         "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Yanky Put and indent right" },
    { "<w",         "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Yanky Put and indent left" },
    { ">W",         "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Yanky Put before and indent right" },
    { "<W",         "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Yanky Put before and indent left" },
    { "=w",         "<Plug>(YankyPutAfterFilter)",            desc = "Yanky Put after applying a filter" },
    { "=W",         "<Plug>(YankyPutBeforeFilter)",           desc = "Yanky Put before applying a filter" },
  },
}

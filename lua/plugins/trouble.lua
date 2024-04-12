return {
  'folke/trouble.nvim',
  -- event = "VeryLazy",
  lazy = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
  keys = {
    {
      "<M-y>",
      "<cmd>TroubleToggle<cr>",
      desc = "toggle trouble",
      silent = true,
      noremap = true
    },
    {
      "<leader>xw",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleToggle workscpace diagnostics",
    },
    {
      "<leader>xd",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleToggle Document Diagnostics",
    },
    {
      "<leader>xl",
      "<cmd>TroubleToggle loclist<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleToggle Location List",
    },
    {
      "<leader>xq",
      "<cmd>TroubleToggle quickfix<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleToggle quickfix",
    },
    {
      "gR",
      "<cmd>TroubleToggle lsp_references<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleToggle Lsp Lsp References",
    },
    {
      "<leader>xgt",
      "<cmd>TroubleToggle lsp_type_definitions<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleToggle Lsp Type Definitions",
    },
    {
      "<leader>xgd",
      "<cmd>TroubleToggle lsp_definitions<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleToggle Lsp Definitions"
    },
  }
}

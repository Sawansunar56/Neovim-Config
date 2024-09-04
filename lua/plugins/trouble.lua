return {
  'folke/trouble.nvim',
  -- event = "VeryLazy",
  opts ={},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>xu",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "TroubleToggle xx diagnostics",
    },
    {
      "<leader>xo",
      "<cmd>Trouble dignostics toggle filter.buf=0<cr>",
      desc = "TroubleToggle diagnostics current buffer ",
    },
    {
      "<leader>xr",
      "<cmd>Trouble lsp_references toggle<cr>",
      desc = "Trouble Lsp References",
    },
    {
      "<leader>xi",
      "<cmd>Trouble lsp_implementations toggle<cr>",
      desc = "Trouble Lsp implementations",
    },
    {
      "<leader>xt",
      "<cmd>Trouble lsp_type_definitions toggle<cr>",
      desc = "Trouble Lsp Type Definitions",
    },
    {
      "<leader>xn",
      "<cmd>Trouble lsp_definitions toggle<cr>",
      desc = "Trouble Lsp Definitions"
    },
    {
      "<leader>xm",
      "<cmd>Trouble lsp_declarations toggle<cr>",
      desc = "toggle trouble",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "TroubleToggle Location List",
    },
    {
      "<leader>xk",
      "<cmd>Trouble quickfix toggle<cr>",
      desc = "Trouble quickfix",
    },
    {
      "<leader>xj",
      "<cmd>Trouble lsp_document_symbols toggle<cr>",
      desc = "Trouble lsp document symbols",
    },
    {
      "<leader>xw",
      "<cmd>Trouble symbols toggle<cr>",
      desc = "Trouble symbol",
    },
  }
}

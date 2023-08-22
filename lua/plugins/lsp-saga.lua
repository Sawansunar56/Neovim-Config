return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({})
  end,
  keys = {
    {
      "[E",
      function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      mode = "n"
    },
    { "]E",
      function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end },

    { "<leader>ca",  "<cmd>Lspsaga code_action<CR>",            mode = { "n", "v" }, },
    { "<A-d>",       "<cmd>Lspsaga term_toggle<CR>",            mode = { "n", "t" }, },
    { "<leader>gh",  "<cmd>Lspsaga finder<CR>" },
    { "<leader>gr",  "<cmd>Lspsaga rename<CR>" },
    { "<leader>gar", "<cmd>Lspsaga rename ++project<CR>" },
    -- -- Peek definition
    -- -- Use <C-t> to jump back
    { "<leader>gD",  "<cmd>Lspsaga peek_definition<CR>" },
    { "<leader>gd",  "<cmd>Lspsaga goto_definition<CR>" },
    -- -- Peek type definition
    -- -- Use <C-t> to jump back
    { "<leader>gT",  "<cmd>Lspsaga peek_type_definition<CR>" },
    { "<leader>gt",  "<cmd>Lspsaga goto_type_definition<CR>" },
    { "<leader>sl",  "<cmd>Lspsaga show_line_diagnostics<CR>" },
    { "<leader>sc",  "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
    { "<leader>sb",  "<cmd>Lspsaga show_buf_diagnostics<CR>" },
    { "[e",          "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
    { "]e",          "<cmd>Lspsaga diagnostic_jump_next<CR>" },
    { "<leader>o",   "<cmd>Lspsaga outline<CR>" },
    { "<Leader>K",   "<cmd>Lspsaga hover_doc<CR>" },
    { "<leader>hk",  "<cmd>Lspsaga hover_doc ++keep<CR>" },
    { "<leader>ci",  "<cmd>Lspsaga incoming_calls<CR>" },
    { "<leader>co",  "<cmd>Lspsaga outgoing_calls<CR>" },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional,
    'nvim-tree/nvim-web-devicons'      -- optional
  },
}

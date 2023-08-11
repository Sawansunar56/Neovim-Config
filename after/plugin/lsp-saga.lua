require("lspsaga").setup({})

local keymap = vim.keymap.set
keymap("n", "<leader>gh", "<cmd>Lspsaga finder<CR>")
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>")
keymap("n", "<leader>gar", "<cmd>Lspsaga rename ++project<CR>")
-- Peek definition
-- Use <C-t> to jump back
keymap("n", "<leader>gD", "<cmd>Lspsaga peek_definition<CR>")
keymap("n","<leader>gd", "<cmd>Lspsaga goto_definition<CR>")
-- Peek type definition
-- Use <C-t> to jump back
keymap("n", "<leader>gT", "<cmd>Lspsaga peek_type_definition<CR>")
keymap("n","<leader>gt", "<cmd>Lspsaga goto_type_definition<CR>")
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
keymap("n", "<Leader>K", "<cmd>Lspsaga hover_doc<CR>")
keymap("n", "<leader>hk", "<cmd>Lspsaga hover_doc ++keep<CR>")
keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

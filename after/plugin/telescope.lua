local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>bd', builtin.diagnostics, { desc = "list diagnostics" })
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = "Find recently opened files" })
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "find files anywhere" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git Searches" })
vim.keymap.set('n', '<leader>pl', builtin.live_grep, { desc = "Search in file" })
vim.keymap.set('n', '<leader>pg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>ps', builtin.grep_string, { desc = "Find string from grep" })
-- vim.keymap.set('n', '<leader>/', function()
--   builtin.current_buffer_fuzzy_find()
-- end, {})
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "search help" });

require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')
local theme = require('telescope.themes')
local map = vim.keymap.set

local function flatter()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

map("n", "<leader>wsd", function()
  builtin.lsp_dynamic_workspace_symbols(theme.get_dropdown())
end, { desc = "dynamic workspace symbols" })
map("n", "<leader>wso", function()
  builtin.lsp_document_symbols(theme.get_dropdown())
end, { desc = "lsp document symbols" })
map("n", "<leader>wsl", function()
  builtin.lsp_workspace_symbols(theme.get_dropdown())
end, { desc = "workspace symbols" })

map("n", "<leader>gr", builtin.lsp_references, { desc = "gives out the references in a telescope list" })
map("n", "<leader>gi", builtin.lsp_implementations, { desc = "gives out the implementations in a telescope list" })
map('n', '<leader>bd', builtin.diagnostics, { desc = "list diagnostics" })
map('n', '<leader>?', builtin.oldfiles, { desc = "Find recently opened files" })
map('n', '<leader>pf', builtin.find_files, { desc = "find files anywhere" })
map('n', '<C-p>', builtin.git_files, { desc = "Git Searches" })
map('n', '<leader>pl', builtin.live_grep, { desc = "Search in file" })
map('n', '<leader>pg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
map('n', '<leader>ps', builtin.grep_string, { desc = "Find string from grep" })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(theme.get_dropdown {
    winblend = 10,
    previewer = false,
  }, { desc = "searches only the current buffer for the string" })
end, { desc = '[/] Fuzzily search in current buffer' })
map('n', '<leader>ht', builtin.help_tags, { desc = "search help" });
map('n', '<leader>bb', builtin.buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>ke', builtin.keymaps, { desc = 'Get all the keymaps' })
map("n", "<Leader>cs", function()
  builtin.colorscheme(
    theme.get_dropdown {
      winblend = 10,
      enable_preview = true
    }
  -- {
  --   theme = "dropdown",
  --   winblend = 10,
  --   enable_preview = true
  -- }
  )
end, { desc = "color scheme" })
map('n', '<Leader><Leader>f', flatter, { desc = "completely removes the background colors" })


map('n', '<leader>tr', builtin.registers, { desc = "telescope register list" })
map('n', '<leader>tj', builtin.jumplist, { desc = "telescope jumplist" })
map('n', '<leader>tqs', builtin.quickfixhistory, { desc = "telescope quickfix history" })
map('n', '<leader>tq', builtin.quickfix, { desc = "telescope quickfix" })
map('n', '<leader>tm', builtin.marks, { desc = "telescope marks list " })
map('n', '<leader>th', builtin.highlights, { desc = "telescope highlights" })
map('n', '<leader>to', builtin.command_history, { desc = "telescope command history" })

map('n', '<leader>ph', ":Telescope file_browser<cr>", { desc = "telescope command history" })
map('n', '<leader>pt', ":Telescope file_browser path=%:p:h select_buffer=true<cr>", { desc = "telescope command history" })

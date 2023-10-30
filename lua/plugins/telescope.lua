return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  keys = {
    { '<leader>tr',  "<cmd>Telescope registers<cr>",       desc = "telescope register list" },
    { '<leader>tj',  "<cmd>Telescope jumplist<cr>",        desc = "telescope jumplist" },
    { '<leader>tqs', "<cmd>Telescope quickfixhistory<cr>", desc = "telescope quickfix history" },
    { '<leader>tq',  "<cmd>Telescope quickfix<cr>",        desc = "telescope quickfix" },
    { '<leader>tm',  "<cmd>Telescope marks<cr>",           desc = "telescope marks list " },
    { '<leader>th',  "<cmd>Telescope highlights<cr>",      desc = "telescope highlights" },
    { '<leader>to',  "<cmd>Telescope command_history<cr>", desc = "telescope command history" },
    {
      "<leader>gr",
      "<cmd>Telescope lsp_references<cr>",
      desc =
      "gives out the references in a telescope list"
    },
    {
      "<leader>gi",
      "<cmd>Telescope lsp_implementations<cr>",
      desc =
      "gives out the implementations in a telescope list"
    },
    { '<leader>bd', "<cmd>Telescope diagnostics<cr>", desc = "list diagnostics" },
    { '<leader>?',  "<cmd>Telescope oldfiles<cr>",    desc = "Find recently old files" },
    { '<leader>pf', "<cmd>Telescope find_files<cr>",  desc = "find files anywhere" },
    {
      '<leader>pig',
      "<cmd>Telescope find_files no_ignore=true<cr>",
      desc =
      "find files anywhere including no ignore"
    },
    {
      '<leader>pih',
      "<cmd>Telescope find_files hidden=true<cr>",
      desc =
      "find files anywhere including hidden"
    },
    {
      '<leader>pif',
      "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
      desc =
      "find files anywhere including no ignore and hidden files"
    },
    { '<C-p>',      "<cmd>Telescope git_files<cr>",   desc = "Git Searches" },
    { '<leader>pl', "<cmd>Telescope live_grep<cr>",   desc = "Search in file" },
    { '<leader>ht', "<cmd>Telescope help_tags<cr>",   desc = "search help" },
    { '<leader>bb', "<cmd>Telescope buffers<cr>",     desc = '[ ] Find existing buffers' },
    { '<leader>ke', "<cmd>Telescope keymaps<cr>",     desc = 'Get all the keymaps' },
    { '<leader>ps', "<cmd>Telescope grep_string<cr>", desc = "Find string from grep" },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',

    'nvim-telescope/telescope-fzf-native.nvim',
  },
  config = function()
    local builtin = require('telescope.builtin')
    local theme = require('telescope.themes')
    local map = vim.keymap.set


    map("n", "<leader>wsd", function()
      builtin.lsp_dynamic_workspace_symbols(theme.get_dropdown())
    end, { desc = "dynamic workspace symbols" })
    map("n", "<leader>wso", function()
      builtin.lsp_document_symbols(theme.get_dropdown())
    end, { desc = "lsp document symbols" })
    map("n", "<leader>wsl", function()
      builtin.lsp_workspace_symbols(theme.get_dropdown())
    end, { desc = "workspace symbols" })

    map('n', '<leader>pg', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
    map('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(theme.get_dropdown {
        winblend = 10,
        previewer = false,
      }, { desc = "searches only the current buffer for the string" })
    end, { desc = '[/] Fuzzily search in current buffer' })
    map("n", "<Leader>cs", function()
      builtin.colorscheme(
        theme.get_dropdown {
          winblend = 10,
          enable_preview = true
        }
      )
    end, { desc = "color scheme" })
  end
}

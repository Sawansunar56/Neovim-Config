return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>ter", "<cmd>Telescope registers<cr>",       desc = "telescope register list" },
        { "<leader>tej", "<cmd>Telescope jumplist<cr>",        desc = "telescope jumplist" },
        { "<leader>tes", "<cmd>Telescope quickfixhistory<cr>", desc = "telescope quickfix history" },
        { "<leader>teq", "<cmd>Telescope quickfix<cr>",        desc = "telescope quickfix" },
        { "<leader>tem", "<cmd>Telescope marks<cr>",           desc = "telescope marks list " },
        { "<leader>teh", "<cmd>Telescope highlights<cr>",      desc = "telescope highlights" },
        { "<leader>teo", "<cmd>Telescope command_history<cr>", desc = "telescope command history" },
        {
            "<leader>gr",
            "<cmd>Telescope lsp_references<cr>",
            desc =
            "Telescope References"
        },
        {
            "<leader>gi",
            "<cmd>Telescope lsp_implementations<cr>",
            desc =
            "gives out the implementations in a telescope list"
        },
        { "<leader>bd", "<cmd>Telescope diagnostics<cr>", desc = "list diagnostics" },
        { "<leader>?",  "<cmd>Telescope oldfiles<cr>",    desc = "Find recently old files" },
        { "<leader>pf", "<cmd>Telescope find_files<cr>",  desc = "find files anywhere" },
        {
            "<leader>pig",
            "<cmd>Telescope find_files no_ignore=true<cr>",
            desc =
            "find files anywhere including no ignore"
        },
        {
            "<leader>pih",
            "<cmd>Telescope find_files hidden=true<cr>",
            desc =
            "find files anywhere including hidden"
        },
        {
            "<leader>pif",
            "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
            desc =
            "find files anywhere including no ignore and hidden files"
        },
        { "<C-p>",       "<cmd>Telescope git_files<cr>",                     desc = "Git Searches" },
        { "<leader>pl",  "<cmd>Telescope live_grep<cr>",                     desc = "live grep all files" },
        { "<leader>ht",  "<cmd>Telescope help_tags<cr>",                     desc = "search help" },
        { "<leader>bb",  "<cmd>Telescope buffers<cr>",                       desc = "[ ] Find existing buffers" },
        { "<leader>ke",  "<cmd>Telescope keymaps<cr>",                       desc = "Get all the keymaps" },
        { "<leader>pg",  "<cmd>Telescope grep_string<cr>",                   desc = "Find string from grep" },
        { "<leader>pr",  "<cmd>Telescope resume<cr>",                        desc = "telescope resume previous picker" },
        { "<leader>tpd", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "telescope resume previous picker" },
        { "<leader>tpf", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "telescope resume previous picker" },
        { "<leader>tpw", "<cmd>Telescope lsp_workspace_symbols<cr>",         desc = "telescope resume previous picker" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
        local builtin = require("telescope.builtin")
        local theme = require("telescope.themes")
        local map = vim.keymap.set

        local function telescope_live_grep_open_files()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files"
            }
        end

        map("n", "<leader>s/", telescope_live_grep_open_files, { desc = "Search / in open Files" })

        map("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        map("n", "<leader>pw", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word });
        end)
        map("n", "<leader>td", function()
            builtin.diagnostics(theme.get_dropdown { bufnr = 0, winblend = 10, previewer = false })
        end, { desc = "telescope diagnostics for current buffer" })
        map("n", "<leader>/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(theme.get_dropdown {
                winblend = 10,
                previewer = false,
            }, { desc = "searches only the current buffer for the string" })
        end, { desc = "[/] Fuzzily search in current buffer" })
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

return {
    'stevearc/oil.nvim',
    lazy = true,
    opts = {
        default_file_explorer = false,
        columns = {
            "icon",
        },
        buf_options = {
            buflisted = false,
            bufhidden = "hide",
        },
        win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        delete_to_trash = false,
        skip_confirm_for_simple_edits = false,
        trash_command = "trash-put",
        prompt_save_on_select_new_entry = true,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<M-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<M-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
        },
        use_default_keymaps = true,
        view_options = {
            show_hidden = false,
            is_hidden_file = function(name, bufnr)
                return vim.startswith(name, ".")
            end,
            is_always_hidden = function(name, bufnr)
                return false
            end,
            sort = {
                { "type", "asc" },
                { "name", "asc" },
            },
        },
        float = {
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            override = function(conf)
                return conf
            end,
        },
        preview = {
            -- min_width and max_width can be a single value or a list of mixed integer/float types.
            -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
            max_width = 0.9,
            -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
            min_width = { 40, 0.4 },
            -- optionally define an integer/float for the exact width of the preview window
            width = nil,
            -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_height and max_height can be a single value or a list of mixed integer/float types.
            -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
            max_height = 0.9,
            -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
            min_height = { 5, 0.1 },
            -- optionally define an integer/float for the exact height of the preview window
            height = nil,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
        },
        -- Configuration for the floating progress window
        progress = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = { 10, 0.9 },
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            minimized_border = "none",
            win_options = {
                winblend = 0,
            },
        },
    },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

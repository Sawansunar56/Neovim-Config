return {
    'echasnovski/mini.nvim',
    event = "VeryLazy",
    config = function()
        local map = vim.keymap.set
        -- mini ai
        local gen_ai_spec = require('mini.extra').gen_ai_spec
        local spec_treesitter = require("mini.ai").gen_spec.treesitter
        require("mini.ai").setup({
            mappings = {
                around = 'a',
                inside = 'i',

                around_next = 'an',
                inside_next = 'in',
                around_last = 'al',
                inside_last = 'il',

                goto_left = 'g[',
                goto_right = 'g]',
            },

            n_lines = 50,

            search_method = 'cover_or_next',

            silent = false,

            -- commands available
            -- numbered objects
            -- ? - prompt left side and  right side to select di?
            -- t - tag
            -- f - function call
            -- a - argument -

            custom_textobjects = {
                F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
                o = spec_treesitter({ a = '@loop.outer', i = '@loop.inner' }),
                m = spec_treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),
                e = spec_treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
                c = spec_treesitter({ a = '@class.outer', i = '@class.inner' }),
                v = spec_treesitter({ a = '@call.outer', i = '@call.inner' }),
                b = spec_treesitter({ a = '@block.outer', i = '@block.inner' }),
                B = gen_ai_spec.buffer(),
                D = gen_ai_spec.diagnostic(),
                I = gen_ai_spec.indent(),
                L = gen_ai_spec.line(),
                N = gen_ai_spec.number(),
            }
        })

        map("n", "<leader>ai",
            function()
                vim.g.miniai_disable = not vim.g.miniai_disable
            end,
            { desc = "toggle mini ai for global" })
        ---

        --- mini files
        require("mini.extra").setup()
        require("mini.files").setup()
        require("mini.jump").setup()
        require("mini.jump2d").setup({
            mappings = {
                start_jumping = ',',
            }
        })
        require("mini.move").setup()
        require("mini.operators").setup()
        require("mini.pick").setup()

        -- require("mini.git").setup()

        require('mini.splitjoin').setup({
            mappings = {
                toggle = 'gS',
                split = '<leader>sp',
                join = '<leader>sj',
            },
        })

        require("mini.surround").setup({
            mappings = {
                add = "gza",            -- Add surrounding in Normal and Visual modes
                delete = "gzd",         -- Delete surrounding
                find = "gzf",           -- Find surrounding (to the right)
                find_left = "gzF",      -- Find surrounding (to the left)
                highlight = "gzh",      -- Highlight surrounding
                replace = "gzr",        -- Replace surrounding
                update_n_lines = "gzn", -- Update `n_lines`
            }
        })

        -- mini pick keymap
        map("n", "<leader>pcf", ":Pick files<cr>", { desc = "Mini Picker" })
        map("n", "<leader>pck", ":Pick git_files<cr>", { desc = "Mini Picker git" })
        map("n", "<leader>pcb", ":Pick buffers<cr>", { desc = "Mini buffers" })
        map("n", "<leader>pcg", ":Pick grep<cr>", { desc = "Mini grep" })
        map("n", "<leader>pcl", ":Pick grep_live<cr>", { desc = "Mini grep live" })
        map("n", "<leader>pce", ":Pick resume<cr>", { desc = "Mini resume" })
        map("n", "<leader>pct", ":Pick explorer<cr>", { desc = "Mini explorer" })
        map("n", "<leader>pcr", ":Pick lsp scope='references'<cr>", { desc = "Mini lsp references" })
        map("n", "<leader>pco", ":Pick oldfiles<cr>", { desc = "Mini old files" })
        map("n", "<leader>pch", ":Pick history<cr>", { desc = "Mini history" })

        -- mini files keymap
        map("n", "<leader>nf", "<cmd>lua MiniFiles.open()<cr>", { desc = "Open Mini Files" })
    end,
}

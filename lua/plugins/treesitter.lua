return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = "VeryLazy",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
        ("RRethy/nvim-treesitter-textsubjects"),
        ("nvim-treesitter/nvim-treesitter-textobjects"),
        ("nvim-treesitter/nvim-treesitter-context"),
    },
    config = function()
        require "nvim-treesitter.configs".setup {
            -- A list of parser names, or "all" (the four listed parsers should always be installed)
            ensure_installed = { "c", "javascript", "typescript", "java", "cpp", "rust", "lua", "vim", "go", "vimdoc" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-w>",     -- maps in normal mode to init the node/scope selection
                    node_incremental = "<M-w>",   -- increment to the upper named parent
                    node_decremental = "<M-C-w>", -- decrement to the previous node
                    scope_incremental = "<M-e>",  -- increment to the upper scope (as defined in locals.scm)
                }
            },
            textsubjects = {
                enable = true,
                prev_selection = ",", -- (Optional) keymap to select the previous selection
                keymaps = {
                    ["."] = "textsubjects-smart",
                    ["a;"] = "textsubjects-container-outer",
                    ["i;"] = "textsubjects-container-inner",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["as"] = "@statement.outer",
                        -- ["is"] = "@scopename.inner",
                        --["ak"] = "@comment.outer",
                    }
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>rna"] = "@parameter.inner", -- swap object property with next
                        ["<leader>rn:"] = "@property.outer",  -- swap parameters/argument with next
                        ["<leader>rnm"] = "@function.outer",  -- swap function with next
                    },
                    swap_previous = {
                        ["<leader>rpa"] = "@parameter.inner", -- swap parameters/argument with prev
                        ["<leader>rp:"] = "@property.outer",  -- swap object property with prev
                        ["<leader>rpm"] = "@function.outer",  -- swap function with previous
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]p"] = { query = "@parameter.inner", desc = "Next parameter inner" },
                        ["]f"] = { query = "@call.outer", desc = "Next function call start" },
                        ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
                        ["]c"] = { query = "@class.outer", desc = "Next class start" },
                        ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                        ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

                        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                        -- Below example nvim-treesitter"s `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                        ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                    goto_next_end = {
                        ["]F"] = { query = "@call.outer", desc = "Next function call end" },
                        ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
                        ["]C"] = { query = "@class.outer", desc = "Next class end" },
                        ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                        ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                    },
                    goto_previous_start = {
                        ["[p"] = { query = "@parameter.inner", desc = "Prev parameter inner" },
                        ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
                        ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
                        ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                        ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                        ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
                    },
                    goto_previous_end = {
                        ["[M"] = { query = "@function.outer", desc = "prev function end" },
                        ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
                        ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                        ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                        ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
                    },
                },
            },
        }
    end
}

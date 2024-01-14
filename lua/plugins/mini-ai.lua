-- MAN, REMEMBER THAT YOU TYPE WHAT IS IN THE CONFIG
-- So, if there is a and i, yeah it would work and also an, in, etc are all keys
-- So, operator vn key, van"
return {
    'echasnovski/mini.ai',
    event = "VeryLazy",
    version = false,
    dependencies = {
        'echasnovski/mini.extra',
    },
    config = function()
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

        vim.keymap.set("n", "<leader>ai",
            function()
                vim.g.miniai_disable = not vim.g.miniai_disable
            end,
            { desc = "toggle mini ai for global" })
    end
}

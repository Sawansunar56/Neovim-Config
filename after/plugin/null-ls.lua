local null_ls = require("null-ls")


local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
    sources = {
        -- formatting
        formatting.prettierd,

        -- runs only for markdown 
        -- formatting.deno_fmt -- runs for all
        formatting.deno_fmt.with({
            filetypes={"markdown"},
        }),

        --  diagnostics
        diagnostics.eslint_d
    },
})

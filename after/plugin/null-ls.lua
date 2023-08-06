local null_ls = require("null-ls")


local formatting = null_ls.builtins.formatting
null_ls.setup({
  sources = {
    -- formatting
    formatting.prettierd,

    -- runs only for markdown
    -- formatting.deno_fmt -- runs for all
    formatting.deno_fmt.with({
      filetypes = { "markdown" },
    }),

    formatting.clang_format.with({
      filetypes = { "cpp", "c" },
    }),
  },
})

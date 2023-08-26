return {
  'jose-elias-alvarez/null-ls.nvim',
  event = "VeryLazy",
  opts = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    return {
      sources = {
        -- formatting
        formatting.prettierd,

        -- runs only for markdown
        -- formatting.deno_fmt -- runs for all
        formatting.deno_fmt.with({
          filetypes = { "markdown" },
        }),
      },
    }
  end
}

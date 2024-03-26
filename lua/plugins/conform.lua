return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fk",
            mode = { "n", "v" },
            function()
                require("conform").format({ async = true, lsp_fallback = false })
            end,
            desc = "Conform format"
        }
    },
    opts = {
        formatters_by_ft = {
            c = { "clang_format" },
            cpp = { "clang_format" },
            lua = { "stylua" },
            javascript = { { "prettierd", "prettier" } },
            javascriptreact = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            typescriptreact = { { "prettierd", "prettier" } },
            css = { { "prettierd", "prettier" } },
            scss = { { "prettierd", "prettier" } },
            svelte = { { "prettierd", "prettier" } },
            go = { "golines", "gofumpt" },
            markdown = { "mdslw" },
        }
    },
}

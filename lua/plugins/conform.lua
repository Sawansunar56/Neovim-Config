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
            lua = { "stylua" },
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            css = { { "prettierd", "prettier" } },
            svelte = { { "prettierd", "prettier" } },
            go = { "golines", "gofumpt" },
        }
    },
}

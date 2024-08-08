---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
    local conform = require("conform")
    for i = 1, select("#", ...) do
        local formatter = select(i, ...)
        if conform.get_formatter_info(formatter, bufnr).available then
            return formatter
        end
    end
    return select(1, ...)
end

-- stop after first would now only work for this particular table. Others would
-- just magically continue and apply all the specified formatters like the go 
-- one below.
-- If you need something to work after this formatters you apply the function 
-- above
local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fk",
            mode = { "n", "v" },
            function()
                require("conform").format({ async = true })
            end,
            desc = "Conform format"
        },
    },
    opts = {
        formatters_by_ft = {
            c = { "clang_format" },
            cpp = { "clang_format" },
            lua = { "stylua" },
            javascript = prettier,
            javascriptreact = prettier,
            typescript = prettier,
            typescriptreact = prettier,
            css = prettier,
            scss = prettier,
            svelte = prettier,
            go = { "golines", "gofumpt" },
            markdown = { "mdslw" },
            rust = { "rustfmt" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}

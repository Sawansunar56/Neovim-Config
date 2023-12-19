return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
        local lsp = require("lsp-zero")
        lsp.extend_lspconfig()
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = false,
            float = { border = "rounded" },
            -- float = true,
        })

        lsp.on_attach(function(client, bufnr)
            local map = vim.keymap.set

            map("n", "gd", function()
                vim.lsp.buf.definition()
            end, { buffer = bufnr, desc = "lsp definition" })
            map("n", "gD", function()
                vim.lsp.buf.declaration()
            end, { buffer = bufnr, desc = "lsp declaration" })
            map("n", "gi", function()
                vim.lsp.buf.implementation()
            end, { buffer = bufnr, desc = "lsp implementation" })
            map("n", "go", function()
                vim.lsp.buf.type_definition()
            end, { buffer = bufnr, desc = "lsp type definition" })
            map("n", "K", function()
                vim.lsp.buf.hover()
            end, { buffer = bufnr, desc = "lsp hover" })
            map("n", "<leader>vws", function()
                vim.lsp.buf.workspace_symbol()
            end, { buffer = bufnr, desc = "lsp workspace symbol" })
            map("n", "<leader>vd", function()
                vim.diagnostic.setloclist()
            end, { buffer = bufnr, desc = "lsp set loca list" })
            map("n", "gl", function()
                vim.diagnostic.open_float()
            end, { buffer = bufnr, desc = "lsp open float" })
            map("n", "[d", function()
                vim.diagnostic.goto_next()
            end, { buffer = bufnr, desc = "lsp goto next diagnostic" })
            map("n", "]d", function()
                vim.diagnostic.goto_prev()
            end, { buffer = bufnr, desc = "lsp goto previous diagnostic" })
            map("n", "<leader>vca", function()
                vim.lsp.buf.code_action()
            end, { buffer = bufnr, desc = "lsp code action" })
            map("n", "<leader>vrr", function()
                vim.lsp.buf.references()
            end, { buffer = bufnr, desc = "lsp references" })
            map("n", "<leader>vrn", function()
                vim.lsp.buf.rename()
            end, { buffer = bufnr, desc = "lsp rename" })
            map("i", "<C-h>", function()
                vim.lsp.buf.signature_help()
            end, { buffer = bufnr, desc = "lsp help" })
        end)

        lsp.set_sign_icons({
            error = "✘",
            warn = "▲",
            hint = "⚑",
            info = "»",
        })

        require("lspconfig").glsl_analyzer.setup {}

        require("neodev").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "tsserver", "rust_analyzer", "lua_ls", "gopls", "clangd" },
            handlers = {
                lsp.default_setup,
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace"
                                },
                                workspace = { checkThirdParty = false },
                                telemetry = { enable = true },
                                hint = { enable = true },
                            },
                        },
                    })
                end,

                gopls = function()
                    require("lspconfig").gopls.setup({
                        settings = {
                            gopls = {
                                semanticTokens = true,
                                gofumpt = true,
                                hints = {
                                    assignVariableTypes = true,
                                    compositeLiteralFields = true,
                                    compositeLiteralTypes = true,
                                    constantValues = true,
                                    functionTypeParameters = true,
                                    parameterNames = true,
                                    rangeVariableTypes = true,
                                },
                            },
                        },
                    })
                end,

                clangd = function()
                    require("lspconfig").clangd.setup({
                        InlayHints = {
                            Enabled = true,
                        },
                        cmd = {
                            "clangd",
                            "--offset-encoding=utf-16",
                            "--header-insertion=never",
                        },
                    })
                end,
            },
        })
    end,
}

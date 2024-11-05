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
        -- vim.diagnostic.config({
        --     virtual_text = true,
        --     signs = true,
        --     update_in_insert = false,
        --     underline = true,
        --     severity_sort = false,
        --     float = { border = "rounded" },
        --     -- float = true,
        -- })

        local lsp_attach = function(client, bufnr)
            local map = vim.keymap.set
            if client.name == "md" or vim.g.stop_lsp then
                vim.cmd [[LspStop]]
            end

            map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = bufnr, desc = "lsp definition" })
            map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = bufnr, desc = "lsp declaration" })
            map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = bufnr, desc = "lsp implementation" })
            map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = bufnr, desc = "lsp type definition" })
            map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = bufnr, desc = "lsp hover" })
            map("n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>",
                { buffer = bufnr, desc = "lsp workspace symbol" })
            map("n", "<leader>vd", "<cmd>lua vim.diagnostic.setloclist()<cr>",
                { buffer = bufnr, desc = "lsp set loca list" })
            map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = bufnr, desc = "lsp open float" })
            map("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<cr>",
                { buffer = bufnr, desc = "lsp goto next diagnostic" })
            map("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                { buffer = bufnr, desc = "lsp goto previous diagnostic" })
            map("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>",
                { buffer = bufnr, desc = "lsp code action" })
            map("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = bufnr, desc = "lsp references" })
            map("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr, desc = "lsp rename" })
            map("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr, desc = "lsp help" })
        end

        lsp.extend_lspconfig({
            sign_text = {
                error = "✘",
                warn = "▲",
                hint = "⚑",
                info = "»",
            },
            lsp_attach = lsp_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        })


        require("lspconfig").glsl_analyzer.setup {}

        require("lspconfig").clangd.setup({
            InlayHints = {
                Enabled = true,
            },
            filetypes = {
                "c", "cpp", "inl"
            },
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
                "--header-insertion=never",
            },
        })
        require('mason').setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "lua_ls",
                "gopls",
                -- "clangd"
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
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
                tailwindcss = function()
                    require("lspconfig").tailwindcss.setup({
                        filetypes = {
                            "html",
                            "svelte",
                            "vue",
                            "typescript",
                            "typescriptreact",
                            "javascript",
                            "javascriptreact",
                            "css",
                            "ejs",
                            "astro",
                        }
                    })
                end,
                -- clangd = function()
                --     require("lspconfig").clangd.setup({
                --         InlayHints = {
                --             Enabled = true,
                --         },
                --         filetypes = {
                --             "c", "cpp", "inl"
                --         },
                --         cmd = {
                --             "clangd",
                --             "--offset-encoding=utf-16",
                --             "--header-insertion=never",
                --         },
                --     })
                -- end,
            },
        })
    end,
}

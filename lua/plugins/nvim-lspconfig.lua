return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "saghen/blink.cmp" },
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('sown-lsp-attach', { clear = true }),
      callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map("K", vim.lsp.buf.hover, "lsp hover")
        map('vws', vim.lsp.buf.workspace_symbol, 'lsp workspace symbol')
        map("gl", vim.diagnostic.open_float, "lsp open float")

        map('[d', function()
          vim.diagnostic.jump { count = -1 }
        end, 'Previous diagnostic')
        map(']d', function()
          vim.diagnostic.jump { count = 1 }
        end, 'Next diagnostic')
        map('[e', function()
          vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
        end, 'Previous error')
        map(']e', function()
          vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
        end, 'Next error')


        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        -- local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
        --   local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.document_highlight,
        --   })
        --
        --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.clear_references,
        --   })
        --
        --   vim.api.nvim_create_autocmd('LspDetach', {
        --     group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        --     callback = function(event2)
        --       vim.lsp.buf.clear_references()
        --       vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        --     end,
        --   })
        -- end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- local lsp_attach = function(client, bufnr)
    --     local map = vim.keymap.set
    --     if client.name == "md" then
    --         vim.cmd [[LspStop]]
    --     end
    --
    --     map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = bufnr, desc = "lsp hover" })
    --     map("n", "<leader>vd", "<cmd>lua vim.diagnostic.setloclist()<cr>",
    --         { buffer = bufnr, desc = "lsp set loca list" })
    --     map("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr, desc = "lsp help" })
    --
    --     map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = bufnr, desc = "lsp definition" })
    --     map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = bufnr, desc = "lsp declaration" })
    --     map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { buffer = bufnr, desc = "lsp implementation" })
    --     map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { buffer = bufnr, desc = "lsp type definition" })
    --     map("n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>",
    --         { buffer = bufnr, desc = "lsp workspace symbol" })
    --     map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = bufnr, desc = "lsp open float" })
    --         { buffer = bufnr, desc = "lsp goto previous diagnostic" })
    --     map("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>",
    --         { buffer = bufnr, desc = "lsp code action" })
    --     map("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = bufnr, desc = "lsp references" })
    --     map("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr, desc = "lsp rename" })
    -- end

    vim.diagnostic.config {
      severity_sort = true,
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.HINT] = "⚑",
          [vim.diagnostic.severity.INFO] = "»",
        }
      } or {},
    }

    -- old method
    -- vim.diagnostic.config({
    --     virtual_text = true,
    --     signs = true,
    --     update_in_insert = false,
    --     underline = true,
    --     severity_sort = false,
    --     float = { border = "rounded" },
    --     -- float = true,
    -- })


    -- require("lspconfig").glsl_analyzer.setup {}

    -- require("lspconfig").clangd.setup({
    --     InlayHints = {
    --         Enabled = true,
    --     },
    --     filetypes = {
    --         "c", "cpp", "inl"
    --     },
    --     cmd = {
    --         "clangd",
    --         "--offset-encoding=utf-16",
    --         "--header-insertion=never",
    --     },
    -- })


    local servers = {
      glsl_analyzer = true,
      lua_ls = {
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
      },
      rust_analzyer = true,
      gopls = {
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
      },
      tailwindcss = {
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
      },
      clangd = {
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
      },
    }

    require("mason").setup({})
    require("mason-lspconfig").setup()
    --   {
    --   ensure_installed = {
    --     "rust_analyzer",
    --     "lua_ls",
    --     "gopls",
    --     -- "clangd"
    --   },
    --   handlers = {
    --     function(server_name)
    --       local server = servers[server_name] or {}
    --       -- This handles overriding only values explicitly passed
    --       -- by the server configuration above. Useful when disabling
    --       -- certain features of an LSP (for example, turning off formatting for ts_ls)
    --       -- server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
    --       require('lspconfig')[server_name].setup(server)
    --     end,
    --   },
    -- }
  end,
}

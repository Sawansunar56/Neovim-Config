return {
  'neovim/nvim-lspconfig',
  cmd = "LspInfo",
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- LSP Support
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
  },
  config = function()
    local lsp = require("lsp-zero").preset({})

    lsp.ensure_installed({
      'tsserver',
      'rust_analyzer'
    })

    -- Fix Undefined global 'vim'
    lsp.nvim_workspace()
    lsp.on_attach(function(client, bufnr)
      -- client.server_capabilities.semanticTokensProvider = nil
      local opts = { buffer = bufnr, remap = false }
      local map = vim.keymap.set

      map("n", "gd", function() vim.lsp.buf.definition() end, opts)
      map("n", "<leader>ed", function() vim.lsp.buf.declaration() end, opts)
      map("n", "<leader>gI", function() vim.lsp.buf.implementation() end, opts)
      map("n", "K", function() vim.lsp.buf.hover() end, opts)
      map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      map("n", "<leader>vd", function() vim.diagnostic.setloclist() end, opts)
      map("n", "gl", function() vim.diagnostic.open_float() end, opts)
      map("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      map("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      map("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

      -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      --   vim.lsp.buf.format()
      -- end)
    end)

    require("neodev").setup({})
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local ls = require("lspconfig")

    -- for globla semanticTokens close.
    -- lsp.set_server_config({
    --   on_init = function(client)
    --     client.server_capabilities.semanticTokensProvider = nil
    --   end,
    -- })
    ls.gopls.setup({
      settings = {
        gopls = {
          semanticTokens = true,
          gofumpt = true
        }
      }
    })
    ls.lua_ls.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })

    ls.clangd.setup {
      on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
      capabilities = cmp_nvim_lsp.default_capabilities(),
      flags = {
        debounce_text_changes = 150,
        allow_incremental_sync = false
      },
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }

    lsp.setup()

    lsp.set_preferences({
      sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
      }
    })

    -- to disable semantic highlighting
    -- lsp.set_server_config({
    --   on_init = function(client)
    --     client.server_capabilities.semanticTokensProvider = nil
    --   end,
    -- })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = false,
      float = true,
    })
  end
}

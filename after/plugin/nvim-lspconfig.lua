local ls = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }


ls.clangd.setup({
  -- on_init = function(client)
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end,
  capabilities = capabilities
})

ls.gopls.setup({
  settings = {
    gopls = {
      -- semanticTokens = true,
      gofumpt = true
    }
  }
})

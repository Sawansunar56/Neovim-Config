local ls = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

ls.clangd.setup({
  capabilities = capabilities
})

ls.gopls.setup({
  settings = {
    gopls = {
      gofumpt = true
    }
  }
})

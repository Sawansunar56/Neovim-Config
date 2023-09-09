return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'dev-v3',
  lazy = true,
  config = false,
  init = function()
    vim.g.lsp_zero_extend_cmp = 0
    vim.g.lsp_zero_extend_lspconfig = 0
  end
}

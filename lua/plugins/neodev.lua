return {
  "folke/neodev.nvim",
  ft = "lua",
  opts = {
      library = {
          enabled = true,
          runtime = true,
          types = true,
          plugins = true,
      },
      setup_jsonls = true,
      override = function(root_dir, options) end,
      lspconfig = true,
      pathStrict = true,
  },
}

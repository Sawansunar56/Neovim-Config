return {
  "nvim-neorg/neorg",
  event = "VeryLazy",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},    -- Loads default behaviour
        ["core.concealer"] = {},   -- Adds pretty icons to your documents
        ["core.export"] = {},
        ["core.dirman"] = {        -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    }
  end,
}
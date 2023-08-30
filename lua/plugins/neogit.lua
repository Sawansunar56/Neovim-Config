return {
  "NeogitOrg/neogit",
  lazy = true,
  keys = {
    { "<leader>ng", "<cmd>Neogit<cr>", desc = "Neogit Open" }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
  },
  config = true
}

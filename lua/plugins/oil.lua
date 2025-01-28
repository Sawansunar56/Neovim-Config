return {
  'stevearc/oil.nvim',
  lazy = true,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }
  },
  -- Optional dependencies
  dependencies = {
    { "echasnovski/mini.icons", opts = {} }
  },
}

return {
  "folke/zen-mode.nvim",
  lazy = true,
  keys = {
    {
      "<leader>zn",
      function()
        require("zen-mode").toggle({
          window = {
            width = .5
          }
        })
      end,
      desc = "toggle zen mode"
    },
    {
      "<leader>zm",
      ":lua require('zen-mode').toggle( { window = { width = .5 } })<left><left><left><left><left>",
      desc = "custom zen mode"
    },
    {
      "<leader>zf",
      function()
        require("zen-mode").toggle({
          window = {
            width = 1.0,
            options = {
              linebreak = false,
              wrap = false
            }
          }
        })
      end,
      desc = "toggle zen full mode"
    },

  },
  opts = {
    window = {
      options = {
        linebreak = true,
        wrap = true
      }
    }
  }
}

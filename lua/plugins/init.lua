return {
  -- themes
  {
    "projekt0n/github-nvim-theme",
  },
  -- {
  --   "hardhackerlabs/theme-vim",
  -- },
  {
    "loctvl842/monokai-pro.nvim",
  },
  {
    "edeneast/nightfox.nvim",
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'navarasu/onedark.nvim',

    config = function()
      require('onedark').setup {
        style = 'deep',
        toggle_style_key = "<leader>cr",
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' },
      }
    end
  },
  {
    'Mofiqul/vscode.nvim',
  },
  {
    "ellisonleao/gruvbox.nvim",

  },
  { "catppuccin/nvim",            name = "catppuccin" },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly",  lazy = false },

}

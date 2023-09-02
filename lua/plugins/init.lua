return {
  -- themes
  {
    "projekt0n/github-nvim-theme",
    event = "VeryLazy",
  },
  {
    "pynappo/theme-vim",
    event = "VeryLazy",
  },
  {
    "loctvl842/monokai-pro.nvim",
    event = "VeryLazy",
  },
  {
    "edeneast/nightfox.nvim",
    event = "VeryLazy",
  },
  {
    'folke/tokyonight.nvim',
    event = "VeryLazy",
  },
  {
    'navarasu/onedark.nvim',
    event = "VeryLazy",
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
    event = "VeryLazy",
  },
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",

  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", event = "VeryLazy" },
}

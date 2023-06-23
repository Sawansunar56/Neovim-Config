local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
  },

  -- themes
  { "projekt0n/github-nvim-theme" },
  { "hardhackerlabs/theme-vim" },
  { "loctvl842/monokai-pro.nvim" },
  { "edeneast/nightfox.nvim" },
  { 'folke/tokyonight.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'Mofiqul/vscode.nvim' },
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim",            name = "catppuccin" },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
  },

  ('jose-elias-alvarez/null-ls.nvim'),
  { 'numToStr/Comment.nvim',   opts = {} },

  ('christoomey/vim-tmux-navigator'),
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  ('nvim-treesitter/nvim-treesitter-textobjects'),
  ('nvim-treesitter/nvim-treesitter-context'),
  ('nvim-treesitter/playground'),
  ('theprimeagen/harpoon'),
  ('mbbill/undotree'),
  ('tpope/vim-fugitive'),
  ('theprimeagen/refactoring.nvim'),
  { 'akinsho/toggleterm.nvim', event = "VeryLazy", version = "*", config = true },
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
      }
    end
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {}
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }
}

local opts = {}
require("lazy").setup(plugins, opts)

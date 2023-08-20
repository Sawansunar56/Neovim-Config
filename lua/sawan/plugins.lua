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
  -- telescope
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- lualine
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
  { 'Mofiqul/vscode.nvim' },
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim",         name = "catppuccin" },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly",  lazy = false },

  -- movement stuff
  ('christoomey/vim-tmux-navigator'),
  ('theprimeagen/harpoon'),
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
      }
    end
  },

  -- treesitter stuff
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  ('RRethy/nvim-treesitter-textsubjects'),
  ('nvim-treesitter/nvim-treesitter-textobjects'),
  ('nvim-treesitter/nvim-treesitter-context'),
  ('nvim-treesitter/playground'),

  -- extra
  ('mbbill/undotree'),

  -- Git stuff
  ('tpope/vim-fugitive'),

  -- refactoring
  ('theprimeagen/refactoring.nvim'),

  -- terminal
  { 'akinsho/toggleterm.nvim',    event = "VeryLazy", version = "*", config = true },

  -- lsp stuff
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional,
      'nvim-tree/nvim-web-devicons'      -- optional
    }
  },
  ('jose-elias-alvarez/null-ls.nvim'),
  { 'numToStr/Comment.nvim',   opts = {} },
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
  },

  -- debugging
  -- { 'mfussenegger/nvim-dap' },
  -- { "rcarriga/nvim-dap-ui" },
  -- { "leoluz/nvim-dap-go" },
  -- { "theHamsta/nvim-dap-virtual-text" },
  -- { "nvim-telescope/telescope-dap.nvim" },

  -- neovim configuration stuff
  { "folke/neodev.nvim",       opts = {} },
  { "jake-stewart/jfind.nvim", branch = "2.0" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          -- to disable jump in normal f t F T
          enabled = false
          -- jump_labels = false
        }
      },
    },
    -- stylua: ignore
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump(
            {
              search = {
                mode = function(str)
                  return "\\<" .. str
                end,
              },
            })
        end,
        desc = "Flash"
      },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  }
}

local opts = {}
require("lazy").setup(plugins, opts)

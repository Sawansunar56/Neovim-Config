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
    { 'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
        'rose-pine/neovim',
        name  = 'rose-pine',
        lazy = false,
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    },
        { "catppuccin/nvim", name = "catppuccin" },
        ('christoomey/vim-tmux-navigator'),
        'folke/tokyonight.nvim',
        {
            'nvim-treesitter/nvim-treesitter',
            build = function()
                require("nvim-treesitter.install").update({ with_sync = true})
            end,
        },
        ('nvim-treesitter/playground'),
        ('theprimeagen/harpoon'),
        ('mbbill/undotree'),
        ('tpope/vim-fugitive'),
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            dependencies = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},             -- Required
                {'williamboman/mason.nvim'},           -- Optional
                {'williamboman/mason-lspconfig.nvim'}, -- Optional

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},         -- Required
                {'hrsh7th/cmp-nvim-lsp'},     -- Required
                {'hrsh7th/cmp-buffer'},       -- Optional
                {'hrsh7th/cmp-path'},         -- Optional
                {'saadparwaiz1/cmp_luasnip'}, -- Optional
                {'hrsh7th/cmp-nvim-lua'},     -- Optional

                -- Snippets
                {'L3MON4D3/LuaSnip'},             -- Required
                {'rafamadriz/friendly-snippets'}, -- Optional
            }
        }
}

local opts = {}
require("lazy").setup(plugins, opts)


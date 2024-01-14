return {
    -- {
    --     'stevearc/profile.nvim'
    -- },
    {
        'cpea2506/one_monokai.nvim',
        event = "VeryLazy",
    },
    {
        "luisiacc/gruvbox-baby",
        event = "VeryLazy"
    },
    {
        "scottmckendry/cyberdream.nvim",
        event = "VeryLazy",
        config = function()
            require("cyberdream").setup({
            -- Recommended - see "Configuring" below for more config options
            transparent = true,
            italic_comments = true,
            hide_fillchars = true,
            borderless_telescope = true,
        })
        end
    },
    {
        'shaunsingh/moonlight.nvim',
        event = "VeryLazy",
    },
    {
        'rebelot/kanagawa.nvim',
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
        -- lazy = true,
        event = "VeryLazy",
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = true,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("rose-pine")
        end
    },
    { "bluz71/vim-nightfly-colors", name = "nightfly", event = "VeryLazy" },
    { 'cryptomilk/nightcity.nvim',  version = '*',     event = "VeryLazy" },
    { "tiagovla/tokyodark.nvim",    event = "VeryLazy" },
}
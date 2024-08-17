local cus_event = "User LazyColorscheme"

return {
    -- {
    --     "stevearc/profile.nvim"
    -- },
    {
        "cpea2506/one_monokai.nvim",
        event = cus_event,
    },
    {
        "rockyzhang24/arctic.nvim",
        branch = "v2",
        dependencies = { "rktjmp/lush.nvim" },
        event = cus_event,
    },
    {
        "dgox16/oldworld.nvim",
        event = cus_event,
    },
    {
        "savq/melange-nvim",
        event = cus_event,
    },
    {
        "xero/miasma.nvim",
        event = cus_event,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        event = cus_event,
    },
    {
        "Yazeed1s/minimal.nvim",
        event = cus_event,
    },
    {
        "sainnhe/gruvbox-material",
        event = cus_event,
    },
    {
        "blazkowolf/gruber-darker.nvim",
        event = cus_event,
    },
    {
        "luisiacc/gruvbox-baby",
        event = cus_event,
    },
    {
        "oxfist/night-owl.nvim",
        event = cus_event,
    },
    {
        "craftzdog/solarized-osaka.nvim",
        event = cus_event,
    },
    {
        "comfysage/evergarden",
        event = cus_event,
    },
    {
        "olimorris/onedarkpro.nvim",
        event = cus_event,
    },
    {
        "neanias/everforest-nvim",
        event = cus_event,
    },
    -- {
    --     "2giosangmitom/nightfall.nvim",
    --     event = cus_event,
    -- },
    {
        "ribru17/bamboo.nvim",
        event = cus_event,
    },
    {
        "eldritch-theme/eldritch.nvim",
        event = cus_event,
    },
    {
        "Mofiqul/dracula.nvim",
        event = cus_event,

    },
    {
        "ellisonleao/gruvbox.nvim",
        event = cus_event,
        opts = {
            contrast = "hard"
        }
    },
    -- {
    --     "morhetz/gruvbox",
    --     event = cus_event,
    -- },
    {
        "scottmckendry/cyberdream.nvim",
        event = cus_event,
        opts = {
            -- Recommended - see "Configuring" below for more config options
            transparent = true,
            italic_comments = true,
            hide_fillchars = true,
            borderless_telescope = true,
        }
    },
    {
        "shaunsingh/moonlight.nvim",
        event = cus_event,
    },
    {
        "rebelot/kanagawa.nvim",
        event = cus_event,
    },
    {
        "loctvl842/monokai-pro.nvim",
        event = cus_event,
    },
    {
        "edeneast/nightfox.nvim",
        event = cus_event,
    },
    {
        "folke/tokyonight.nvim",
        event = cus_event,
        -- config = function()
        --     require("tokyonight").setup({
        --         style = "moon",
        --         on_colors = function(colors)
        --             colors.bg = "#16161e"
        --         end,
        --     })
        -- end,
    },
    {
        "navarasu/onedark.nvim",
        event = cus_event,
        config = function()
            require("onedark").setup {
                style = "deep",
                toggle_style_key = "<leader>cr",
                toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer" },
            }
        end
    },
    {
        "Mofiqul/vscode.nvim",
        event = cus_event,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        event = cus_event,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        event = cus_event,
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme("rose-pine")
        -- end
    },
    { "bluz71/vim-nightfly-colors", name = "nightfly", event = cus_event },
    { "cryptomilk/nightcity.nvim",  version = "*",     event = cus_event },
    { "tiagovla/tokyodark.nvim",    event = cus_event },
}

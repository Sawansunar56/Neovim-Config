local rs = require('rose-pine')
local od = require('onedark')
rs.setup({
    disable_background = true
})

function Colors(color)
    if (color == "tkn") then
        color = "tokyonight-night"
    elseif (color == "tks") then
        color = "tokyonight-storm"
    elseif (color == "tkm") then
        color = "tokyonight-moon"
    elseif (color == "rs") then
        rs.setup {
            dark_variant = "main"
        }
        color = "rose-pine"
    elseif (color == "rsm") then
        rs.setup {
            dark_variant = "moon"
        }
        color = "rose-pine"
    elseif (color == "cf") then
        color = "catppuccin-frappe"
    elseif (color == "cm") then
        color = "catppuccin-macchiato"
    elseif (color == "co") then
        color = "catppuccin-mocha"
    elseif (color == "g") then
        color = "gruvbox"
    elseif (color == "od") then
        od.setup {
            style = 'dark'
        }
        color = "onedark"
        -- od.load()
    elseif (color == "odr") then
        od.setup {
            style = 'darker'
        }
        color = "onedark"
        -- od.load()
    elseif (color == "oc") then
        od.setup {
            style = 'cool'
        }
        color = "onedark"
        -- od.load()
    elseif (color == "oe") then
        od.setup {
            style = 'deep'
        }
        color = "onedark"
        -- od.load()
    elseif (color == "ow") then
        od.setup {
            style = 'warm'
        }
        color = "onedark"
        -- od.load()
    elseif (color == "owr") then
        od.setup {
            style = 'warmer'
        }
        color = "onedark"
    elseif (color == "vs") then
        color = "vscode"
    else
        color = "tokyonight"
    end
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colors()

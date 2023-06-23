-- local rs = require('rose-pine')
-- local od = require('onedark')
-- rs.setup({
--   disable_background = true
-- })

-- This is stuff I don't know nothing about
-- but it seems to be vim api stuff
local o, wo, bo      = vim.o, vim.wo, vim.bo
local options        = {}

options.scope        = {}

options.scope.option = { o }
options.scope.buffer = { o, bo }
options.scope.window = { o, wo }

options.set          = function(scope, option, value)
  for _, s in ipairs(scope) do
    s[option] = value
  end
end

local option         = options.scope.option

-- M > themes > actual theme
--  each theme contains a function for activation
local M              = {
  themes = {
    tokyonight = {
      style = { "storm", "moon", "night", "day" },
      transparent = false,
      lualine = function(_)
        return "tokyonight"
      end,
      activate = function(style, transparent)
        require("tokyonight").setup({
          style = style,
          transparent = transparent,
        })

        vim.cmd.colorscheme("tokyonight")
      end,
    },
    vscode = {
      style = { "light", "dark" },
      transparent = false,
      lualine = function(_)
        return "vscode"
      end,
      activate = function(style, transparent)
        require("vscode").setup({
          style = style,
          transparent = transparent,
        })

        vim.cmd.colorscheme("vscode")
      end,
    },
    catppuccin = {
      style = { "latte", "frappe", "macchiato", "mocha" },
      transparent = false,
      lualine = function(_)
        return "catppuccin"
      end,
      activate = function(style, transparent)
        require("catppuccin").setup({
          flavour = style,
          transparent_background = transparent,
        })

        vim.cmd.colorscheme("catppuccin")
      end,
    },
    gruvbox = {
      style = { "light", "dark" },
      transparent = false,
      lualine = function(_)
        return "gruvbox"
      end,
      activate = function(style, _)
        vim.o.background = style
        vim.cmd.colorscheme("gruvbox")
      end,
    },

    onedark = {
      style = { "dark", "darker", "cool", "deep", "warm", "warmer" },
      transparent = false,
      lualine = function(_)
        return "onedark"
      end,
      activate = function(style, transparent)
        require("onedark").setup({
          style = style,
          transparent = transparent,
          transparent_sidebar = transparent,
        })

        require("onedark").load()
      end,
    },
    rosepine = {
      style = { "main", "moon", "dawn" },
      transparent = false,
      lualine = function(_)
        return "rose-pine"
      end,
      activate = function(style, transparent)
        require("rose-pine").setup({
          disable_background = true,
          variant = style,
        })
        print(transparent)

        vim.cmd.colorscheme("rose-pine")
      end,
    },
    github = {
      style = { "dark", "dark_dimmed", "dark_default", "light", "light_default" },
      transparent = false,
      lualine = function(style)
        return "github_" .. style
      end,
      activate = function(style, transparent)
        require("github-theme").setup({
          options = { transparent = transparent },
        })

        vim.cmd.colorscheme("github_" .. style)
      end,
    },
    hardhacker = {
      style = { "dark", "darker" },
      transparent = false,
      lualine = function(_)
        return "palenight"
      end,
      activate = function(style, _)
        if style == "darker" then
          vim.g.hardhacker_darker = 1
        else
          vim.g.hardhacker_darker = 0
        end

        vim.cmd.colorscheme("hardhacker")
      end,
    },
    monokai = {
      style = { "classic", "octagon", "pro", "machine", "ristretto", "spectrum" },
      transparent = false,
      lualine = function(_)
        return "monokai-pro"
      end,
      activate = function(style, transparent)
        require("monokai-pro").setup({
          filter = style,
          transparent_background = transparent,
        })

        vim.cmd.colorscheme("monokai-pro")
      end,
    },
    nightfox = {
      style = { "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox" },
      transparent = false,
      lualine = function(style)
        return style
      end,
      activate = function(style, transparent)
        require("nightfox").setup({
          transparent = transparent,
        })

        vim.cmd.colorscheme(style)
      end,
    },
  },
}

-- this is the primary activator 
function M.activate_theme(theme, style, transparent)
  local entry = M.themes[theme]
  entry.activate(style, transparent)

  if transparent then
    options.set(option, "cursorline", false)
  else
    options.set(option, "cursorline", true)
  end

  -- require("lualine").setup({
  --   options = {
  --     theme = entry.lualine(style),
  --   },
  -- })
end

-- function to make the background transparent
function M.flatter()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- function Colors(color)
--   if (color == "tkn") then
--     color = "tokyonight-night"
--   elseif (color == "tks") then
--     color = "tokyonight-storm"
--   elseif (color == "tkm") then
--     color = "tokyonight-moon"
--   elseif (color == "rs") then
--     rs.setup {
--       dark_variant = "main"
--     }
--     color = "rose-pine"
--   elseif (color == "rsm") then
--     rs.setup {
--       dark_variant = "moon"
--     }
--     color = "rose-pine"
--   elseif (color == "cf") then
--     color = "catppuccin-frappe"
--   elseif (color == "cm") then
--     color = "catppuccin-macchiato"
--   elseif (color == "co") then
--     color = "catppuccin-mocha"
--   elseif (color == "g") then
--     color = "gruvbox"
--   elseif (color == "od") then
--     od.setup {
--       style = 'dark'
--     }
--     color = "onedark"
--     -- od.load()
--   elseif (color == "odr") then
--     od.setup {
--       style = 'darker'
--     }
--     color = "onedark"
--     -- od.load()
--   elseif (color == "oc") then
--     od.setup {
--       style = 'cool'
--     }
--     color = "onedark"
--     -- od.load()
--   elseif (color == "oe") then
--     od.setup {
--       style = 'deep'
--     }
--     color = "onedark"
--     -- od.load()
--   elseif (color == "ow") then
--     od.setup {
--       style = 'warm'
--     }
--     color = "onedark"
--     -- od.load()
--   elseif (color == "owr") then
--     od.setup {
--       style = 'warmer'
--     }
--     color = "onedark"
--   elseif (color == "vs") then
--     color = "vscode"
--   else
--     color = "tokyonight"
--   end
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--
-- Colors()Colors()

return M

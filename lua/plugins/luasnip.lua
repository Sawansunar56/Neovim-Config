return {
  'L3MON4D3/LuaSnip',
  config = function()
    if not pcall(require, "luasnip") then
      return
    end

    local ls = require "luasnip"
    local types = require "luasnip.util.types"
    local fmt = require("luasnip.extras.fmt").fmt

    ls.config.set_config {
      history = false,

      updateevents = "TextChanged, TextChangedI",

      enable_autosnippets = true,
      ext_opts = nil,
    }


    local s = ls.snippet
    local sn = ls.snippet_node
    local f = ls.function_node
    local i = ls.insert_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local t = ls.text_node

    -- local date = function() return {os.date('%Y-%m-%d')} end

    require("luasnip.loaders.from_lua").load({ paths = "~/.dotfiles/nvim/snippets/" })

    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set("i", "<c-l>", function()
      if ls.choice_active() then
        ls.change_choice()
      end
    end)

    vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
  end
}

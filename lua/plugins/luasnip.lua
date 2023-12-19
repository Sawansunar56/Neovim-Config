return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  dependencies =
  { 'rafamadriz/friendly-snippets' },       -- Optional
  config = function()
    if not pcall(require, "luasnip") then
      return
    end

    local ls = require "luasnip"

    ls.config.set_config {
      history = false,

      updateevents = "TextChanged, TextChangedI",

      enable_autosnippets = true,
      ext_opts = nil,
    }

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

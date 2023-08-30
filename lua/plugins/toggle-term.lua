return {
  'akinsho/toggleterm.nvim',
  lazy = true,
  version = "*",
  keys = {
    {
      "<A-e>",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local t = Terminal:new({ cmd = "lazygit", direction = "float" })
        return t:toggle()
      end,
      mode = { "n" }
    },
  },
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<A-t>]],
      size = 10,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
    })
  end,
}

return {
  "NvChad/nvterm",
  event = "VeryLazy",
  config = function()
    require("nvterm").setup({
      terminals = {
        shell = vim.o.shell,
        list = {},
        type_opts = {
          float = {
            relative = 'editor',
            row = 0.06,
            col = 0.08,
            width = 0.85,
            height = 0.8,
            border = "single",
          },
          horizontal = { location = "rightbelow", split_ratio = .3, },
          vertical = { location = "rightbelow", split_ratio = .4 },
        }
      },
      behavior = {
        autoclose_on_quit = {
          enabled = false,
          confirm = true,
        },
        close_on_exit = true,
        auto_insert = true,
      },
    })
    local terminal = require("nvterm.terminal")
    local toggle_modes = { 'n', 't' }
    local mappings = {
      { toggle_modes, '<A-e>',       function() terminal.send('lazygit', 'float') end },
      { toggle_modes, '<leader>nvh', function() terminal.toggle('horizontal') end },
      { toggle_modes, '<leader>nvv', function() terminal.toggle('vertical') end },
      { toggle_modes, '<A-t>',       function() terminal.toggle('float') end },
    }
    local opts = { noremap = true, silent = true }
    for _, mapping in ipairs(mappings) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
    end
  end,
}

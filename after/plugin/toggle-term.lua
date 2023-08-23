require"toggleterm".setup {
  size = 13,
  open_mapping = [[<A-t>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
}

local Terminal = require('toggleterm.terminal').Terminal
local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd= 'lazygit', direction = "float"})
  lazygit:toggle()
end

vim.keymap.set('n', '<A-e>', toggle_lazygit)

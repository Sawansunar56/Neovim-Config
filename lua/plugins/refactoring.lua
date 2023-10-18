return {
  'theprimeagen/refactoring.nvim',
  lazy = true,
  config = true,
  keys = {
    {
      "<leader>ri",
      mode = "v",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
      { desc = "Refactoring from the primagen",  noremap = true, silent = true, expr = false }
    },
  }
}

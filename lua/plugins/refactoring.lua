return {
  'theprimeagen/refactoring.nvim',
  lazy = true,
  keys = {
    {
      "<leader>ri",
      [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
      mode = "v",
      { desc = "Refactoring from the primagen",  noremap = true, silent = true, expr = false }
    },
  }
}

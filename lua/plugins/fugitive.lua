return {
  'tpope/vim-fugitive',
  lazy = true,
  keys = {
    { "<leader>gs", vim.cmd.Git, desc = "Open Fugitive Git" },
  },
}

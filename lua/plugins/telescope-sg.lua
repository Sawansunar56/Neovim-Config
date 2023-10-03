return {
  "Marskey/telescope-sg",
  keys = {
    { '<leader>pa', "<cmd>Telescope ast_grep<cr>", desc = "Find through ast_grep" },
  },
  lazy = true,
  config = function()
    require('telescope').setup {
      extensions = {
        ast_grep = {
          command = {
            "sg",
            "--json=stream",
          },                       -- must have --json=stream
          grep_open_files = false, -- search in opened files
          lang = nil,              -- string value, specify language for ast-grep `nil` for default
        }
      }
    }
    require('telescope').load_extension('ast_grep')
  end,
}

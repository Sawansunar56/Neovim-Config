return {
  "dmtrKovalenko/fff.nvim",
  -- build = "cargo build --release",
  -- or if you are using nixos
  -- build = "nix run .#release",
  opts = {
    -- pass here all the options
  },
  keys = {
    {
      "<Leader>vu",                 -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_files() -- or find_in_git_root() if you only want git files
      end,
      desc = "fff file picker",
    },
    {
      "<Leader>vi",                 -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_in_git_root() -- or find_in_git_root() if you only want git files
      end,
      desc = "fff Git picker",
    },
    {
      "<Leader>vo",                 -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_files_in_dir(vim.fn.expand('%:p:h')) -- or find_in_git_root() if you only want git files
      end,
      desc = "fff file picker current buffer",
    },
  },
}

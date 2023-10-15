return {
    'christoomey/vim-tmux-navigator',
    event = "VeryLazy",
    enabled = function() return jit.os == "Linux" end,
}

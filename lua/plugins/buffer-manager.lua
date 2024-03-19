return {
    "j-morano/buffer_manager.nvim",
    lazy = true,
    keys = {
        { "<c-q>", [[<cmd>lua require("buffer_manager.ui").toggle_quick_menu()<cr>]], desc = "Toggle buffer manager" }
    },
}

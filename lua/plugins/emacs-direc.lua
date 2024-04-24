return {
    "X3eRo0/dired.nvim",
    keys = {
        { "<leader>-", ":Dired<cr>", desc = "Open Emacs Dired" }
    },
    lazy = true,
    opts = {
        path_separator = "/",
        show_banner = false,
        show_icons = false,
        show_hidden = true,
        show_dot_dirs = true,
        show_colors = true,
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}

return {
    "nvim-telescope/telescope-frecency.nvim",
    lazy = true,
    keys = {
        { "<leader>fx", ":Telescope frecency theme=dropdown<cr>",               desc = "frecency" },
        { "<leader>fw", ":Telescope frecency workspace=CWD theme=dropdown<cr>", desc = "frecency cwd" }
    },
    config = function()
        require("telescope").load_extension("frecency")
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
    }
}

return {
    "nvim-telescope/telescope-live-grep-args.nvim",
    lazy = true,
    keys = {
        { "<leader>pk", "<cmd>Telescope live_grep_args<cr>", desc = "live grep args all files" },
    },
    config = function()
        require("telescope").load_extension("live_grep_args")
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
    }
}

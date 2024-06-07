return {
    'echasnovski/mini.pick',
    lazy = true,
    keys = {
        { "<leader>pcf", ":Pick files<cr>",                  desc = "Mini Picker" },
        { "<leader>pck", ":Pick git_files<cr>",              desc = "Mini Picker git" },
        { "<leader>pcb", ":Pick buffers<cr>",                desc = "Mini buffers" },
        { "<leader>pcg", ":Pick grep<cr>",                   desc = "Mini grep" },
        { "<leader>pcl", ":Pick grep_live<cr>",              desc = "Mini grep live" },
        { "<leader>pce", ":Pick resume<cr>",                 desc = "Mini resume" },
        { "<leader>pct", ":Pick explorer<cr>",               desc = "Mini explorer" },
        { "<leader>pcr", ":Pick lsp scope='references'<cr>", desc = "Mini lsp references" },
        { "<leader>pco", ":Pick oldfiles<cr>",               desc = "Mini old files" },
        { "<leader>pch", ":Pick history<cr>",                desc = "Mini history" },
    },
    dependencies = {
        'echasnovski/mini.extra',
    },
    version = false,
    config = true,
}

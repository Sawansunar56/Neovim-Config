return {
    'echasnovski/mini.pick',
    lazy = true,
    keys = {
        { "<leader>pcf", ":Pick files<cr>",            desc = "Mini Picker" },
        { "<leader>pck", ":Pick files tool='git'<cr>", desc = "Mini Picker git" },
        { "<leader>pcb", ":Pick buffers<cr>",          desc = "Mini buffers" },
        { "<leader>pcg", ":Pick grep<cr>",             desc = "Mini grep" },
        { "<leader>pcl", ":Pick grep_live<cr>",        desc = "Mini grep live" },
        { "<leader>pcr", ":Pick resume<cr>",           desc = "Mini resume" },
    },
    version = false,
    config = true,
}

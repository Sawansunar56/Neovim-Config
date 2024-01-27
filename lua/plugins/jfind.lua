return {
    "jake-stewart/jfind.nvim",
    branch = "2.0",
    lazy = true,
    keys = {
        { "<A-f>", function()
            require('jfind').findFile({
                formatPaths = true,
                hidden = true,
                queryPosition = "top",
                preview = true,
                previewPosition = "right",
                callback = {
                    [require('jfind.key').DEFAULT] = vim.cmd.edit,
                    [require('jfind.key').CTRL_S] = vim.cmd.split,
                    [require('jfind.key').CTRL_V] = vim.cmd.vsplit,
                }
            })
        end, desc = "jfind search" },

        { "<leader>fj", function()
            require('jfind').liveGrep({
                exclude = { "*.hpp" },     -- overrides setup excludes
                hidden = true,             -- grep hidden files/directories
                caseSensitivity = "smart", -- sensitive, insensitive, smart
                --     will use vim settings by default
                preview = true,
                previewPosition = "top",
                callback = {
                    [require('jfind.key').DEFAULT] = require('jfind').editGotoLine,
                    [require('jfind.key').CTRL_B]  = require('jfind').splitGotoLine,
                    [require('jfind.key').CTRL_N]  = require('jfind').vsplitGotoLine,
                }
            })
        end, desc = "jfind live grep"}
    },
    enabled = function() return jit.os == "Linux" end,
    config = function()
        local jfind = require("jfind")

        jfind.setup({
            exclude = {
                ".git",
                ".idea",
                ".vscode",
                ".sass-cache",
                ".class",
                "__pycache__",
                "node_modules",
                "target",
                "build",
                "tmp",
                "assets",
                "dist",
                "public",
                "*.iml",
                "*.meta"
            },
            windowBorder = true,
            tmux = false,
        });
    end
}

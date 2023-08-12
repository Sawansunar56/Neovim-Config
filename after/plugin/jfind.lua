local jfind = require("jfind")
local key = require("jfind.key")

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

-- fuzzy file search can be started simply with
-- vim.keymap.set("n", "<A-f>", jfind.findFile)

-- or you can provide more customization
-- for more information, read the "Lua Jfind Interface" section
vim.keymap.set("n", "<A-f>", function()
    jfind.findFile({
        formatPaths = true,
        hidden = true,
        queryPosition = "top",
        preview = true,
        previewPosition = "right",
        callback = {
            [key.DEFAULT] = vim.cmd.edit,
            [key.CTRL_S] = vim.cmd.split,
            [key.CTRL_V] = vim.cmd.vsplit,
        }
    })
end)

-- make sure to rebuld jfind if you want live grep
vim.keymap.set("n", "<leader><A-f>", function()
    jfind.liveGrep({
        exclude = {"*.hpp"},       -- overrides setup excludes
        hidden = true,             -- grep hidden files/directories
        caseSensitivity = "smart", -- sensitive, insensitive, smart
                                   --     will use vim settings by default
        preview = true,
        previewPosition = "top",
        callback = {
            [key.DEFAULT] = jfind.editGotoLine,
            [key.CTRL_B] = jfind.splitGotoLine,
            [key.CTRL_N] = jfind.vsplitGotoLine,
        }
    })
end)


-- fzf lua section

local map = vim.keymap.set
local fzflua = require('fzf-lua')
map('n', '<leader>fz', fzflua.files, { desc = "FZF Files"})
map('n', '<leader>fgg', fzflua.git_files, { desc = "FZF git Files"})
map('n', '<leader>fe', fzflua.grep, { desc = "FZF search rg and grep"})
map('n', '<leader>fl', fzflua.live_grep_native, { desc = "FZF native performance"})
map('n', '<leader>fcc', fzflua.lgrep_curbuf, { desc = "FZF live grep current buffer"})
map('n', '<leader>fi', fzflua.live_grep, { desc = "FZF live grep current project"})
map('n', '<leader>fo', fzflua.oldfiles, { desc = "FZF old files"})


map('n', '<leader>fgr', fzflua.lsp_references, { desc = "FZF lsp references"})
map('n', '<leader>fgd', fzflua.lsp_definitions, { desc = "FZF lsp defintions"})
map('n', '<leader>fbd', fzflua.lsp_declarations, { desc = "FZF lsp declarations "})
map('n', '<leader>fgt', fzflua.lsp_typedefs, { desc = "FZF lsp type definitions"})
map('n', '<leader>fgi', fzflua.lsp_implementations, { desc = "FZF lsp implementations"})
map('n', '<leader>fwl', fzflua.lsp_workspace_symbols, { desc = "FZF lsp workspace symbols"})
map('n', '<leader>fwo', fzflua.lsp_document_symbols, { desc = "FZF lsp document symbols"})
map('n', '<leader>fsd', fzflua.lsp_live_workspace_symbols, { desc = "FZF lsp live workspace symbols"})
map('n', '<leader>fca', fzflua.lsp_code_actions, { desc = "FZF lsp code actions"})
map('n', '<leader>fci', fzflua.lsp_incoming_calls, { desc = "FZF lsp incoming calls"})
map('n', '<leader>fco', fzflua.lsp_outgoing_calls, { desc = "FZF lsp outgoing calls"})
map('n', '<leader>fgh', fzflua.lsp_finder, { desc = "FZF lsp finder"})
map('n', '<leader>fdd', fzflua.diagnostics_document, { desc = "FZF lsp diagnostics document"})
map('n', '<leader>fdw', fzflua.diagnostics_workspace, { desc = "FZF diagnostics workspace"})


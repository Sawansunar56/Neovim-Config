return {
    "ibhagwan/fzf-lua",
    lazy = true,
    -- enabled = function() return jit.os == "Linux" end,
    keys = {
        { "<leader>fn",  "<cmd>FzfLua<cr>",                      desc = "FZF everything" },
        { "<leader>fz",  "<cmd>FzfLua files<cr>",                      desc = "FZF files" },
        { "<leader>fg",  "<cmd>FzfLua git_files<cr>",                  desc = "FZF git files" },
        { "<leader>fo",  "<cmd>FzfLua oldfiles<cr>",                   desc = "FZF old files" },
        { "<leader>fr",  "<cmd>FzfLua resume<cr>",                     desc = "FZF resume" },

        { "<leader>mg",  "<cmd>FzfLua grep<cr>",                       desc = "FZF search rg and grep" },
        { "<leader>mc",  "<cmd>FzfLua grep_curbuf<cr>",                desc = "FZF grep current buffer" },
        { "<leader>mp",  "<cmd>FzfLua grep_project<cr>",               desc = "FZF grep current project" },
        { "<leader>mw",  "<cmd>FzfLua grep_cword<cr>",                 desc = "FZF grep current word" },
        { "<leader>mr",  "<cmd>FzfLua grep_last<cr>",                  desc = "FZF grep last search" },
        { "<leader>lg",  "<cmd>FzfLua live_grep<cr>",                  desc = "FZF live grep current project" },
        { "<leader>lc",  "<cmd>FzfLua lgrep_curbuf<cr>",               desc = "FZF live grep current buffer" },
        { "<leader>ln",  "<cmd>FzfLua live_grep_native<cr>",           desc = "FZF live grep native" },
        { "<leader>lo",  "<cmd>FzfLua live_grep_glob<cr>",             desc = "FZF live grep globe" },
        { "<leader>lr",  "<cmd>FzfLua live_grep_resume<cr>",           desc = "FZF live grep last search" },

        { "<leader>fla", "<cmd>FzfLua lsp_code_actions<cr>",           desc = "FZF lsp code actions" },
        { "<leader>flD", "<cmd>FzfLua lsp_declarations<cr>",           desc = "FZF lsp declarations " },
        { "<leader>fld", "<cmd>FzfLua lsp_definitions<cr>",            desc = "FZF lsp defintions" },
        { "<leader>flr", "<cmd>FzfLua lsp_references<cr>",             desc = "FZF lsp references" },
        { "<leader>flt", "<cmd>FzfLua lsp_typedefs<cr>",               desc = "FZF lsp type definitions" },
        { "<leader>fli", "<cmd>FzfLua lsp_implementations<cr>",        desc = "FZF lsp implementations" },

        { "<leader>fll", "<cmd>FzfLua lsp_workspace_symbols<cr>",      desc = "FZF lsp workspace symbols" },
        { "<leader>flo", "<cmd>FzfLua lsp_document_symbols<cr>",       desc = "FZF lsp document symbols" },
        { "<leader>fld", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "FZF lsp live workspace symbols" },
        { "<leader>flc", "<cmd>FzfLua lsp_incoming_calls<cr>",         desc = "FZF lsp incoming calls" },
        { "<leader>flg", "<cmd>FzfLua lsp_outgoing_calls<cr>",         desc = "FZF lsp outgoing calls" },
        { "<leader>flf", "<cmd>FzfLua lsp_finder<cr>",                 desc = "FZF lsp finder" },

        { "<leader>fpd", "<cmd>FzfLua diagnostics_document<cr>",       desc = "FZF diagnostics document" },
        { "<leader>fpw", "<cmd>FzfLua diagnostics_workspace<cr>",      desc = "FZF diagnostics workspace" },
        { "<leader>fpD", "<cmd>FzfLua lsp_document_diagnostics<cr>",   desc = "FZF lsp document diagnostics" },
        { "<leader>fpW", "<cmd>FzfLua lsp_workspace_diagnostics<cr>",  desc = "FZF lsp workspace diagnostics" },

        { "<leader>feo", "<cmd>FzfLua command_history<cr>",            desc = "FZF command_history" },
        { "<leader>fec", "<cmd>FzfLua commands<cr>",                   desc = "FZF commands" },
        { "<leader>fem", "<cmd>FzfLua marks<cr>",                      desc = "FZF marks" },
        { "<leader>fej", "<cmd>FzfLua jumps<cr>",                      desc = "FZF jumps" },

        { "<leader>fec", "<cmd>FzfLua changes<cr>",                    desc = "FZF changes" },
        { "<leader>fek", "<cmd>FzfLua keymaps<cr>",                    desc = "FZF keymap" },
        { "<leader>fer", "<cmd>FzfLua registers<cr>",                  desc = "FZF registers" },
        { "<leader>feh", "<cmd>FzfLua highlights<cr>",                 desc = "FZF highlights" },
        { "<leader>feq", "<cmd>FzfLua quickfix<cr>",                   desc = "FZF quickfix" },
        { "<leader>fes", "<cmd>FzfLua quickfix_stack<cr>",             desc = "FZF quickfix_stack" },
        { "<leader>fel", "<cmd>FzfLua lines<cr>",                      desc = "FZF lines" },
        { "<leader>feb", "<cmd>FzfLua blines<cr>",                     desc = "FZF buffer lines" },
    },
    -- optional for icon support
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require('fzf-lua').setup({ 'max-perf' })
    end,
}

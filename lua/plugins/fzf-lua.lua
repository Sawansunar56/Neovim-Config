return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  keys = {
    { "<leader>fz",  "<cmd>FzfLua files<cr>",                      desc = "FZF files" },
    { "<leader>mi",  "<cmd>FzfLua git_files<cr>",                  desc = "FZF git files" },
    { "<leader>fe",  "<cmd>FzfLua grep<cr>",                       desc = "FZF search rg and grep" },
    { "<leader>fl",  "<cmd>FzfLua live_grep_native<cr>",           desc = "FZF native live grep" },
    { "<leader>mg",  "<cmd>FzfLua grep_curbuf<cr>",                desc = "FZF grep current buffer" },
    { "<leader>mw",  "<cmd>FzfLua lgrep_curbuf<cr>",               desc = "FZF live grep current buffer" },
    { "<leader>fi",  "<cmd>FzfLua live_grep<cr>",                  desc = "FZF live grep current project" },
    { "<leader>fo",  "<cmd>FzfLua oldfiles<cr>",                   desc = "FZF old files" },
    { "<leader>fgr", "<cmd>FzfLua lsp_references<cr>",             desc = "FZF lsp references" },
    { "<leader>fgd", "<cmd>FzfLua lsp_definitions<cr>",            desc = "FZF lsp defintions" },
    { "<leader>fbd", "<cmd>FzfLua lsp_declarations<cr>",           desc = "FZF lsp declarations " },
    { "<leader>fgt", "<cmd>FzfLua lsp_typedefs<cr>",               desc = "FZF lsp type definitions" },
    { "<leader>fgi", "<cmd>FzfLua lsp_implementations<cr>",        desc = "FZF lsp implementations" },
    { "<leader>fwl", "<cmd>FzfLua lsp_workspace_symbols<cr>",      desc = "FZF lsp workspace symbols" },
    { "<leader>fwo", "<cmd>FzfLua lsp_document_symbols<cr>",       desc = "FZF lsp document symbols" },
    { "<leader>fsd", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "FZF lsp live workspace symbols" },
    { "<leader>fca", "<cmd>FzfLua lsp_code_actions<cr>",           desc = "FZF lsp code actions" },
    { "<leader>fci", "<cmd>FzfLua lsp_incoming_calls<cr>",         desc = "FZF lsp incoming calls" },
    { "<leader>fco", "<cmd>FzfLua lsp_outgoing_calls<cr>",         desc = "FZF lsp outgoing calls" },
    { "<leader>fgh", "<cmd>FzfLua lsp_finder<cr>",                 desc = "FZF lsp finder" },
    { "<leader>fdd", "<cmd>FzfLua diagnostics_document<cr>",       desc = "FZF lsp diagnostics document" },
    { "<leader>fdw", "<cmd>FzfLua diagnostics_workspace<cr>",      desc = "FZF diagnostics workspace" },
    { "<leader>moh", "<cmd>FzfLua command_history<cr>",            desc = "FZF command_history" },
    { "<leader>moo", "<cmd>FzfLua commands<cr>",                   desc = "FZF commands" },
    { "<leader>mm",  "<cmd>FzfLua marks<cr>",                      desc = "FZF marks" },
    { "<leader>mj",  "<cmd>FzfLua jumps<cr>",                      desc = "FZF jumps" },
    { "<leader>mc",  "<cmd>FzfLua changes<cr>",                    desc = "FZF changes" },
    { "<leader>mk",  "<cmd>FzfLua keymaps<cr>",                    desc = "FZF keymap" },
    { "<leader>mr",  "<cmd>FzfLua registers<cr>",                  desc = "FZF registers" },
    { "<leader>mh",  "<cmd>FzfLua highlights<cr>",                 desc = "FZF highlights" },
    { "<leader>mq",  "<cmd>FzfLua quickfix<cr>",                   desc = "FZF quickfix" },
    { "<leader>mqs", "<cmd>FzfLua quickfix_stack<cr>",             desc = "FZF quickfix_stack" },
    { "<leader>ml",  "<cmd>FzfLua lines<cr>",                      desc = "FZF lines" },
    { "<leader>mbl", "<cmd>FzfLua blines<cr>",                     desc = "FZF buffer lines" },
  },
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin" } },
  config = true
}

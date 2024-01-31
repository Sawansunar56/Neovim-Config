return {
  "junegunn/fzf.vim",
  enabled = function() return jit.os ~= "Linux" end,
  keys = {
    { "<leader>xfz", "<cmd>Files<cr>",    desc = "fzf.vim files" },
    { "<leader>xmi", "<cmd>GFiles<cr>",   desc = "fzf.vim git files" },
    { "<leader>xmw", "<cmd>Ag<cr>",       desc = "fzf.vim Ag Search" },
    { "<leader>xmg", "<cmd>Rg<cr>",       desc = "fzf.vim Rg search" },
    { "<leader>xfl", "<cmd>RG<cr>",       desc = "fzf.vim Rg continuous search" },
    { "<leader>xml", "<cmd>Lines<cr>",    desc = "fzf.vim lines" },
    { "<leader>xbl", "<cmd>BLines<cr>",   desc = "fzf.vim buffer lines" },
    { "<leader>xmm", "<cmd>Marks<cr>",    desc = "fzf.vim marks " },
    { "<leader>xmj", "<cmd>Jumps<cr>",    desc = "fzf.vim jumps" },
    { "<leader>xfo", "<cmd>History<cr>",  desc = "fzf.vim old files" },
    { "<leader>xmo", "<cmd>History:<cr>", desc = "fzf.vim command history" },
    { "<leader>xms", "<cmd>History/<cr>", desc = "fzf.vim search history" },
    { "<leader>xmc", "<cmd>Commands<cr>", desc = "fzf.vim commands" },
    { "<leader>xmk", "<cmd>Maps<cr>",     desc = "fzf.vim keymaps" },
  },
  dependencies = {
    { "junegunn/fzf", build = "./install --bin" }
  },
}

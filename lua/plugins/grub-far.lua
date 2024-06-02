return {
    'MagicDuck/grug-far.nvim',
    keys = {
        { "<leader>gf", ":GrugFar<cr>", desc = "Grug Far" }
    },
    config = function()
        require('grug-far').setup{}
    end,
}

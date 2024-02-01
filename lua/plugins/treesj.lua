return {
    'Wansmer/treesj',
    dependencies = 'nvim-treesitter',
    keys = {
        { '<leader>cj', '<cmd>TSJToggle<cr>', desc = 'Join/split code block' },
        { '<leader>cp', '<cmd>TSJSplit<cr>',  desc = 'split code block' },
        { '<leader>ct', '<cmd>TSJJoin<cr>',   desc = 'Join code block' },
    },
    opts = {
        use_default_keymaps = false,
    },
}

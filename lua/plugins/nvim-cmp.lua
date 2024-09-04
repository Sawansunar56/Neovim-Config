return {
    'hrsh7th/nvim-cmp', -- Required
    event = 'InsertEnter',
    dependencies = {
        { 'hrsh7th/cmp-buffer' },       -- Optional
        { 'hrsh7th/cmp-path' },         -- Optional
        { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        { 'hrsh7th/cmp-nvim-lua' },     -- Optional
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
    },
    config = function()
        vim.keymap.set("n", "<leader>cm", function()
            require('cmp').setup({ enabled = false })
        end, { desc = "toggle cmp" })

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        -- Friendly snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        local preferred_sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "buffer" },
        }

        cmp.setup({
            -- window = {
            --     completion = cmp.config.window.bordered(),
            --     documentation = cmp.config.window.bordered(),
            -- },
            -- performance = {
            --     max_view_entries = 7
            -- },
            sources = preferred_sources,
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.config.disable,
                ["<C-Space>"] = cmp.mapping.complete(),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<Tab>'] = cmp_action.luasnip_jump_forward(),
                ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            }
        })
    end
}

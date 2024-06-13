return {
    'hrsh7th/nvim-cmp', -- Required
    event = 'InsertEnter',
    version = false,
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

        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        -- Friendly snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        local preferred_sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            {
                name = "buffer",
                get_bufnrs = function()
                    local buf = vim.api.nvim_get_current_buf()
                    local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                    if byte_size > 1024 * 1024 then -- 1 Megabyte max
                        return {}
                    end
                    return { buf }
                end
            },
        }

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            performance = {
                max_view_entries = 7
            },

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

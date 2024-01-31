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
    },
    config = function()
        vim.keymap.set("n", "<leader>cm", function()
            require('cmp').setup({ enabled = false })
        end, { desc = "toggle cmp" })


        require('lsp-zero').extend_cmp()

        local cmp = require('cmp')

        require('luasnip.loaders.from_vscode').lazy_load()

        local preferred_sources = {
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "path" },
            }

            local function tooBig(bufnr)
                local max_filesize = 10 * 1024 -- 100 KB
                local check_stats = (vim.uv or vim.loop).fs_stat
                local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
                if ok and stats and stats.size > max_filesize then
                    return true
                else
                    return false
                end
            end
            vim.api.nvim_create_autocmd("BufRead", {
                group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
                callback = function(ev)
                    local sources = preferred_sources
                    if not tooBig(ev.buf) then
                        sources[#sources + 1] = { name = "buffer", keyword_length = 4 }
                    end
                    cmp.setup.buffer({
                        sources = cmp.config.sources(sources),
                    })
                end,
            })

        cmp.setup({
            -- formatting = {
            --   -- changing the order of fields so the icon is the first
            --   fields = { 'menu', 'abbr', 'kind' },
            --
            --   -- here is where the change happens
            --   format = function(entry, item)
            --     local menu_icon = {
            --       nvim_lsp = 'λ',
            --       luasnip = '⋗',
            --       buffer = 'Ω',
            --       path = '🖫',
            --       nvim_lua = 'Π',
            --     }
            --
            --     item.menu = menu_icon[entry.source.name]
            --     return item
            --   end,
            -- },
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
                ['<Tab>'] = nil,
                ['<S-Tab>'] = nil
            })
        })
    end
}

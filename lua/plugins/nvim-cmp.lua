return {
  'hrsh7th/nvim-cmp', -- Required
  event = 'InsertEnter',
  dependencies = {
    { 'hrsh7th/cmp-buffer' },       -- Optional
    { 'hrsh7th/cmp-path' },         -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' },     -- Optional
  },
  config = function()
    require('lsp-zero').extend_cmp()

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    require('luasnip.loaders.from_vscode').lazy_load()

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
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      mapping = {
        ["<CR>"] = cmp.config.disable,
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil
      }
    })
  end
}

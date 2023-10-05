vim.cmd [[
augroup highlight_yank
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=50}
augroup END
]]

-- vim.cmd([[
-- augroup _glsl
-- autocmd!
-- autocmd BufRead,BufEnter *.vert set filetype=glsl
-- augroup end
-- ]])

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  pattern = { "*.vert", "*.frag" },
  callback = function()
    vim.opt.filetype = "glsl"
  end,
})

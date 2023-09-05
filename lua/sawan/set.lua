vim.g.python3_host_prog = "/usr/bin/python3"

-- Visual Feeback to yank area
vim.cmd[[
augroup highlight_yank
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=50}
augroup END
]]
local opt = vim.opt

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
if vim.loop.os_uname().sysname == "Windows_NT" then
  opt.undodir = vim.fn.expand('~/.vim/undodir')
else
  opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

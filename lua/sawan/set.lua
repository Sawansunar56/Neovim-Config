vim.g.python3_host_prog = "/usr/bin/python3"

-- Visual Feeback to yank area

local opt = vim.opt

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true

opt.cursorline = true

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

-- vim.cmd [[
-- syntax off
-- ]]
opt.colorcolumn = "80"
opt.list = true
opt.listchars = {
    -- eol = "↲",
    tab = "  ",
    nbsp = "☠"
}

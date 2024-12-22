vim.g.python3_host_prog = "/usr/bin/python3"

-- Visual Feeback to yank area

local opt = vim.opt

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.cursorline = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
if vim.loop.os_uname().sysname == "Windows_NT" then
    opt.undodir = vim.fn.expand('~/.vim/undodir')
    vim.g.undotree_DiffCommand = "FC"
    opt.guifont = { "JetBrainsMono Nerd Font", ":h12" }
else
    opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    opt.guifont = { "JetBrainsMono Nerd Font", ":h11" }
end
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

-- opt.scrolloff = 8
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

-- vim.cmd [[
-- set makeprg=mstart_and_build
-- set errorformat=\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %[A-Z\ ]%#%n:\ %m
-- ]]


-- vim.o.shell = "pwsh"

-- if vim.g.neovide then
-- else
--     if vim.loop.os_uname().sysname == "Windows_NT" then
--     else
--     end
-- end

vim.g.mapleader = " "
local map = vim.keymap.set
map("n", "<leader>pv", vim.cmd.Ex)

-- For increments and decrements  in numbers
map({ "n", "v" }, "<leader>+", "<C-a>")
map({ "n", "v" }, "g+", "g<C-a>")
map({ "n", "v" }, "<leader>-", "<C-x>")
map({ "n", "v" }, "g-", "g<C-x>")


-- moving lines above and below in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- map("n", "<leader>vwm", function()
--   require("vim-with-me").StartVimWithMe()
-- end)
-- map("n", "<leader>svwm", function()
--   require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
--map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>ff", vim.lsp.buf.format)

-- Things I don't understand
-- Well, I finally understand. It is related to the quick list and local list
-- settings of vim. Prime uses it for his reference checking
map("n", "<A-down>", "<cmd>cnext<CR>zz")
map("n", "<A-up>", "<cmd>cprev<CR>zz")
map("n", "<A-x>", "<cmd>cclose<CR>")
map("n", "<A-c>", "<cmd>copen<CR>")
map("n", "<A-n>", "<cmd>lopen<CR>")
map("n", "<A-m>", "<cmd>lclose<CR>")
map("n", "<A-right>", "<cmd>lnext<CR>zz")
map("n", "<A-left>", "<cmd>lprev<CR>zz")

-- Everything window related
map("n", "<Leader>sv", "<C-w>v")     -- vertically splits the screen
map("n", "<Leader>sh", "<C-w>s")     -- horizontally splits the screen
map("n", "<Leader>se", "<C-w>=")     -- equals the area of the splits
map("n", "<Leader>sx", ":close<CR>") -- closes the split
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- buffer shit
map("n", "<leader>bv", ":vnew<CR>")      -- closes the split
map("n", "<leader>bh", ":new<CR>")       -- closes the split
map("n", "<leader>ba", ":buffers<CR>")   -- closes the split
map("n", "<leader>bp", ":bprevious<CR>") -- closes the split
map("n", "<leader>bn", ":bnext<CR>")     -- closes the split
map("n", "<leader>bx", ":bdelete<CR>")   -- closes the split

map("n", "to", ":tabnew<CR>")
map("n", "tx", ":tabclose<CR>")
map("n", "tn", ":tabn<CR>")
map("n", "tp", ":tabp<CR>")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- map("n", "<leader><leader>c", ":lua Colors(\"\")<Left><Left>")

map("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/lua/sawan/plugins.lua<CR>");

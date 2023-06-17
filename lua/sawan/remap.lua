vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- For increments and decrements  in numbers
vim.keymap.set({ "n", "v" }, "+", "<C-a>")
vim.keymap.set({ "n", "v" }, "<leader>+", "g<C-a>")
vim.keymap.set({ "n", "v" }, "-", "<C-x>")
vim.keymap.set({ "n", "v" }, "<leader>-", "g<C-x>")

-- moving lines above and below in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
--vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Things I don't understand
vim.keymap.set("n", "<A-down>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<A-up>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>ck", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>cj", "<cmd>lprev<CR>zz")

-- Everything window related
vim.keymap.set("n", "sv", "<C-w>v")     -- vertically splits the screen
vim.keymap.set("n", "sh", "<C-w>s")     -- horizontally splits the screen
vim.keymap.set("n", "se", "<C-w>=")     -- equals the area of the splits
vim.keymap.set("n", "sx", ":close<CR>") -- closes the split
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

vim.keymap.set("n", "to", ":tabnew<CR>")
vim.keymap.set("n", "tx", ":tabclose<CR>")
vim.keymap.set("n", "tn", ":tabn<CR>")
vim.keymap.set("n", "tp", ":tabp<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>c", ":lua Colors(\"\")<Left><Left>")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/lua/sawan/plugins.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.g.mapleader = " "
vim.g.maplocalleader = ","
local map = vim.keymap.set

-- Function sections
local function flatter()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

map("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay Hints" })

-- Pull out themes
map("n", "<leader>ce", "<cmd>doautocmd User LazyColorscheme<CR>", { desc = "Enable Colors" })

if jit.os ~= "Linux" then
    map("n", "<C-j>", "<C-w>j", { desc = "go to down buffer" })
    map("n", "<C-k>", "<C-w>k", { desc = "go to up buffer" })
    map("n", "<C-h>", "<C-w>h", { desc = "go to left buffer" })
    map("n", "<C-l>", "<C-w>l", { desc = "go to right buffer" })
end
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Go to netrw" })
-- map("i", "<c-s><cr>", "<c-o>o", { desc = "enter anywhere from the file"})
map("n", "<Leader><Leader>f", flatter, { desc = "completely removes the background colors" })
-- For increments and decrements  in numbers
map({ "n", "v" }, "<leader>+", "<C-a>", { desc = "increment numbers" })
map({ "n", "v" }, "g+", "g<C-a>", { desc = "increment continuous numbers" })
map({ "n", "v" }, "<leader>-", "<C-x>", { desc = "decrement numbers" })
map({ "n", "v" }, "g-", "g<C-x>", { desc = "decrement continous numbers" })

-- moving lines above and below in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("i", "<M-j>", "<Down>")
map("i", "<M-h>", "<Left>")
map("i", "<M-k>", "<Up>")
map("i", "<M-l>", "<Right>")

map("i", "<C-k>", "<C-o>de", { desc = "Delete forward word" })
map("i", "<C-l>", "<Del>", { desc = "Delete forward characters" })

map("i", "<C-f>", function()
    vim.api.nvim_input("<Left><C-o>dT")
end)

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")
map("i", "<c-s>l", "<c-o>D", { desc = "delete end to line"})

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")
map("n", "<leader>ff", vim.lsp.buf.format)

-- Things I don't understand
-- Well, I finally understand. It is related to the quick list and local list
-- settings of vim. Prime uses it for his reference checking
map("n", "<A-down>", "<cmd>cnext<CR>zz", { desc = "quickfix next" })
map("n", "<A-up>", "<cmd>cprev<CR>zz", { desc = "quickfix previous" })
map("n", "<A-x>", "<cmd>cclose<CR>", { desc = "quickfix close" })
map("n", "<A-c>", "<cmd>copen<CR>", { desc = "quickfix open" })
map("n", "<A-v>", "<cmd>lopen<CR>", { desc = "locafix open" })
map("n", "<A-b>", "<cmd>lclose<CR>", { desc = "locafix close" })
map("n", "<A-right>", "<cmd>lnext<CR>zz", { desc = "locafix next" })
map("n", "<A-left>", "<cmd>lprev<CR>zz", { desc = "locafix previous" })

-- Everything window related
map("n", "<Leader>sv", "<C-w>v", { desc = "open split vertically" })   -- vertically splits the screen
map("n", "<Leader>sh", "<C-w>s", { desc = "open split horizontally" }) -- horizontally splits the screen
map("n", "<Leader>se", "<C-w>=", { desc = "equal split" })             -- equals the area of the splits
map("n", "<Leader>sx", ":close<CR>", { desc = "close split" })         -- closes the split
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><right>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- buffer shit
map("n", "<leader>bv", ":vnew<CR>", { desc = "buffer vertical open" })
map("n", "<leader>bh", ":new<CR>", { desc = "buffer horizontal open" })
map("n", "<leader>ba", ":buffers<CR>", { desc = "buffer list" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "buffer previous" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "buffer next" })
map("n", "<leader>bxn", ":bdelete<CR>", { desc = "buffer delete" })
map("n", "<leader>bxl", ":%bd|e#|bd#<CR>", { desc = "[X]Close [A]ll buffers but this one" })

-- tab shit
map("n", "<leader>ta", ":tabnew<CR>", { desc = "tab new" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "tab close" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "tab next" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "tab previous" })

map("n", "<leader>e", ":20Lex<CR>", { desc = "netrw side panel" })
map("v", "<leader>rr", "\"hy:%s/<C-r>h//g<left><left>", { desc = "replace current word in the file" })
map("v", "<leader>ri", "\"hy:%s/<C-r>h//gc<left><left><left>", { desc = "replace current word in the file confirmation" })
map("v", "<leader>rG", "\"hy:.,$s/<C-r>h//g<left><left>", { desc = "replace current word from the cursor to the end" })
map("v", "<leader>rgg", "\"hy:1,.s/<C-r>h//g<left><left>", { desc = "replace current word from start to the cursor" })

map("n", "<leader>si", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "replace cur word only in the file (case sensitive)" })
map("v", "<leader><leader>g",
    [[:s/\(virtual \|static \|inline static \|\)\(\S\+ \|\)\(.*)\).*/\2className::\3 {\r}<Left><Left><Left><Left><Left><Left><Left><Left><Left>]])
map("v", "<leader><leader>h",
    [[:s/\(virtual \|static \|inline static \|\)\(\S\+ \)\(.*)\).*/\2className::\3 {\r}<Left><Left><Left><Left><Left><Left><Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

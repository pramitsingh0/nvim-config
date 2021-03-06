local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigate through buffers
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
keymap("n", "sh", ":split<cr>", opts)
keymap("n", "sv", ":vsplit<cr>", opts)

-- Resize buffer with arrows

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":resize +2<CR>", opts)

-- Navigate buffers

keymap("n", "<S-l>", ":bnext<Cr>", opts)
keymap("n", "<S-h>", ":bprevious<Cr>", opts)

-- Easier escape
keymap("i", "jj", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m .<-2<CR>gv=gv", opts)
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)

-- retain word after paste
keymap("v", "p", '"_dP', opts)

-- Close a buffer
keymap("n", "<leader>x", ":close<CR>", opts)

-- Fuzzy finder
keymap("n", "<leader>ff", "<cmd> :Telescope find_files <cr>", opts)
keymap("n", "<leader>lg", "<cmd> :Telescope live_grep <cr>", opts)
keymap("n", "<leader>fe", ":NvimTreeToggle<CR>", opts)

keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>p", '"+p', opts)

keymap("n", "<leader>q", ":Bdelete<CR>", opts)

keymap("n", "<C-\\>", ":ToggleTerm<CR>", opts)

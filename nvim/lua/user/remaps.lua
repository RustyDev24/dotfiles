vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil, {})

-- Move between windows
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<CR>", {})
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<CR>", {})
vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<CR>", {})
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<CR>", {})

-- Close buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})

vim.keymap.set("n", "J", "mzJ`z", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzzzv", {})
vim.keymap.set("n", "N", "Nzzzv", {})
vim.keymap.set("x", "<leader>pp", [["_dP]], {})

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {})

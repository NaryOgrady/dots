vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigate while center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without replacing register
vim.keymap.set("x", "<leader>p", '"_dp')

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- Undu & Redo
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })
vim.keymap.set("i", "<C-z>", "<C-o>u", { noremap = true, silent = true }) -- Works in insert mode too
vim.keymap.set("n", "<C-y>", "<C-r>", { noremap = true, silent = true })

-- Tabs
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

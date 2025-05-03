vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
	noremap = true,
	silent = true,
}

-- NOTE: Nonaktifkan default behavior pada spasi dalam mode normal dan visual
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- NOTE: Menyimpan file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- NOTE: Berpindah text keatas dan kebawah
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

-- NOTE: Clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- NOTE: Quit file
vim.keymap.set("n", "<leader>q", "<cmd> q <CR>", opts)

-- NOTE: Membuat jendela vertikal atau horizontal (seperti Ctrl+\ di VS Code)
vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>", opts)
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", opts)
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", opts)

-- NOTE: move between splits seperti di VS Code
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)

-- NOTE: Copy (Ctrl+C) di mode visual: menyalin ke clipboard
vim.keymap.set("v", "<C-c>", '"+y', opts)

-- NOTE: Cut (Ctrl+X) di mode visual: memotong ke clipboard
vim.keymap.set("v", "<C-x>", '"+d', opts)

-- NOTE: Paste (Ctrl+V) di mode visual: ganti teks terpilih dengan clipboard
vim.keymap.set("v", "<C-v>", '"+p', opts)

-- NOTE: Menutup buffer saat ini
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts)

-- NOTE: Undo (Ctrl+Z) di mode normal
vim.keymap.set("n", "<C-z>", "u", opts)

-- NOTE: Redo (Ctrl+Y) di mode normal
vim.keymap.set("n", "<C-y>", "<C-r>", opts)

-- NOTE: close insert di terminal
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", opts)

-- NOTE: membuat floating terminal
vim.keymap.set("n", "<leader>t", ":Floaterminal<CR>", opts)

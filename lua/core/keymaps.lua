vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
	noremap = true,
	silent = true,
}

-- NOTE:
-- Nonaktifkan default behavior pada spasi dalam mode normal dan visual
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- NOTE:
-- Menyimpan file
-- (Ctrl+S)
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- NOTE:
-- Berpindah text keatas dan kebawah
-- (alt+Up) (alt+Down)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

-- NOTE:
-- Clear highlights
-- (Space)
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- NOTE:
-- Quit file
-- (Space+q)
vim.keymap.set("n", "<leader>q", "<cmd> q <CR>", opts)

-- NOTE:
-- Membuat jendela vertikal atau horizontal
-- (Space+sh) horizontal
-- (Space+sv) vertikal
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", opts)
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", opts)

-- NOTE:
-- Move between split
-- (Ctrl+Up)
-- (Ctrl+Down)
-- (Ctrl+Left)
-- (Ctrl+Right)
vim.keymap.set("n", "<C-Up>", "<C-w>k", opts)
vim.keymap.set("n", "<C-Down>", "<C-w>j", opts)
vim.keymap.set("n", "<C-Left>", "<C-w>h", opts)
vim.keymap.set("n", "<C-Right>", "<C-w>l", opts)

-- NOTE:
-- Select semua text di mode normal
-- (Ctrl+A)
vim.api.nvim_set_keymap("n", "<C-A>", "ggVG", opts)

-- NOTE: Copy di mode visual: menyalin ke clipboard
-- (Ctrl+C)
vim.keymap.set("v", "<C-c>", '"+y', opts)

-- NOTE:
-- Cut di mode visual: memotong ke clipboard
-- (Ctrl+X)
vim.keymap.set("v", "<C-x>", '"+d', opts)

-- NOTE:
-- Paste di mode visual: ganti teks terpilih dengan clipboard
-- (Ctrl+V)
vim.keymap.set("v", "<C-v>", '"+p', opts)

-- NOTE:
-- Berpindah buffer
-- (Space+Tab)
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", opts)

-- NOTE:
-- Menutup buffer saat ini
-- (Space+x)
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts)

-- NOTE:
-- Undo di mode normal
-- (Ctrl+Z)
vim.keymap.set("n", "<C-z>", "u", opts)

-- NOTE:
-- Redo di mode normal
-- (Ctrl+Y)
vim.keymap.set("n", "<C-y>", "<C-r>", opts)

-- NOTE:
-- Close insert di terminal
-- (Space+Esc)
vim.keymap.set("t", "<leader><esc>", "<C-\\><C-n>", opts)

-- NOTE:
-- Membuat floating terminal
-- (Space+t)
vim.keymap.set("n", "<leader>t", ":Floaterminal<CR>", opts)

-- NOTE:
-- select kata dibawah cursor dan select semua sub-kata
-- (Ctrl+D)
vim.api.nvim_set_keymap("n", "<C-d>", "<Plug>(VM-Find-Under)", {})
vim.api.nvim_set_keymap("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", {})

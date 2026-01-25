vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":Neotree close<CR>", { silent = true })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>:wincmd l<CR>:Neotree reveal<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", "<C-w>h", { silent = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>")
vim.keymap.set("n", "<leader>/", "gcc", { remap = true })
vim.keymap.set("v", "<leader>/", "gc", { remap = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<Plug>(VM-Find-Under)", {})
vim.api.nvim_set_keymap("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", {})

-- vim.keymap.set("n", "<leader>nf", function()
-- 	local path = vim.fn.input("New file: ")
-- 	if path == "" then
-- 		return
-- 	end
--
-- 	-- ambil directory dari path
-- 	local dir = vim.fn.fnamemodify(path, ":h")
--
-- 	-- kalau directory bukan '.', buat folder
-- 	if dir ~= "." then
-- 		vim.fn.system({ "mkdir", "-p", dir })
-- 	end
--
-- 	-- buka / buat file
-- 	vim.cmd("edit " .. path)
-- end, { desc = "New file (auto mkdir)" })

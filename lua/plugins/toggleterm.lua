return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			shell = [["C:/Program Files/Git/bin/bash.exe"]],
			direction = "horizontal",
			close_on_exit = false,
			persist_mode = true,
		})
		vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { silent = true })
		vim.keymap.set("t", "<C-\\>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], { silent = true })
		-- vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { silent = true })
		-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
	end,
}

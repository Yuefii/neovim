require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		error("error clonning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.autopairs"),
	require("plugins.alpha"),
	require("plugins.neo-tree"),
	require("plugins.themes.solarized-osaka"),
	require("plugins.bufferline"),
	require("plugins.misc"),
	require("plugins.lualine"),
	require("plugins.neocord"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.hl-chunk"),
	require("plugins.autocompletion"),
	require("plugins.none-ls"),
	require("plugins.multi-cursor"),
})
require("plugins.terminal")

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"javascript",
			"typescript",
			"tsx",
			"jsx",
			"php",
			"phpdoc",
			"html",
			"css",
			"scss",
			"json",
			"blade",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}


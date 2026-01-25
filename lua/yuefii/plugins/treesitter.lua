return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"c",
			"cpp",
			"javascript",
			"typescript",
			"tsx",
			"jsx",
			"rust",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}


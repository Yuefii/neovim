return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				lua = { "stylua" },
				php = { "pint", "php-cs-fixer" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
			},
			format_on_save = true,
		})



	end,
}


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
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
			},
			format_on_save = true,
		})

		vim.api.nvim_create_augroup("ConformAutogroup", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "ConformAutogroup",
			pattern = "*",
			callback = function()
				conform.format({ async = true })
			end,
		})

		require("mason").setup()

		local ensure_installed = {
			"prettier",
			"stylua",
			"clang-format",
			"rustfmt",
		}

		local registry = require("mason-registry")
		for _, pkg in ipairs(ensure_installed) do
			if not registry.is_installed(pkg) then
				registry.get_package(pkg):install()
			end
		end
	end,
}


return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"williamboman/mason.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		local sources = {
			-- JavaScript/TypeScript sources
			require("none-ls.diagnostics.eslint_d").with({
				condition = function(utils)
					return utils.root_has_file(".eslintrc.js")
						or utils.root_has_file(".eslintrc.json")
						or utils.root_has_file("eslint.config.js")
				end,
			}),
			
			-- Code actions
			require("none-ls.code_actions.eslint_d").with({
				condition = function(utils)
					return utils.root_has_file(".eslintrc.js")
						or utils.root_has_file(".eslintrc.json")
						or utils.root_has_file("eslint.config.js")
				end,
			}),
			null_ls.builtins.code_actions.gitsigns,
		}

		null_ls.setup({
			sources = sources,
		})

		-- Keymaps for code actions
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
	end,
}
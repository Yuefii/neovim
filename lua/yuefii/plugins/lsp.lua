return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})

			vim.o.completeopt = "menuone,noinsert,noselect"
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- Diagnostic UI
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					severity = { min = vim.diagnostic.severity.WARN },
				},
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
			})

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

			-- CMP ↔ LSP capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local servers = {
				html = {},
				cssls = {},
				tailwindcss = {},
				ts_ls = {},
				clangd = {},
				rust_analyzer = {},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers)

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})
		end,
	},
}


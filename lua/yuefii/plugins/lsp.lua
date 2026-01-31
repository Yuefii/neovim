return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")



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
				ts_ls = {
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				phpactor = {
					init_options = {
						["language_server_phpstan.enabled"] = false,
						["language_server_psalm.enabled"] = false,
					},
				},
				intelephense = {
					settings = {
						intelephense = {
							diagnostics = {
								enable = true,
								undefinedTypes = true,
								undefinedFunctions = true,
								undefinedConstants = true,
								undefinedClassConstants = true,
								undefinedMethods = false, -- False to avoid Laravel magic method errors
								undefinedProperties = false, -- False to avoid magic properties
								undefinedVariables = true,
							},
						},
					},
					init_options = {
						storagePath = os.getenv("HOME") .. "/.local/share/nvim/intelephense",
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, {
				"phpactor",
				"intelephense",
				"typescript-language-server",
				"eslint-lsp",
				"php-cs-fixer",
				"pint",
				"eslint_d",
				"prettier",
				"stylua",
			})

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}


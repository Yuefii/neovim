return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"supermaven-inc/supermaven-nvim",
			opts = {},
		},
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				-- NOTE: Build ini hanya dijalankan pada Windows dan make tersedia
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp" -- Menambahkan dukungan regex untuk snippet
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		"saadparwaiz1/cmp_luasnip", -- Intergrasi snippet dengan cmp
		"hrsh7th/cmp-nvim-lsp", -- Sumber LSP untuk cmp
		"hrsh7th/cmp-buffer", -- Sumber buffer untuk cmp
		"hrsh7th/cmp-path", -- Sumber path/file untuk system
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		local kind_icons = {
			Text = "󰉿",
			Method = "m",
			Function = "󰊕",
			Constructor = "",
			Field = "",
			Variable = "󰆧",
			Class = "󰌗",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰇽",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰊄",
		}
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = cmp.mapping.preset.insert({
				-- (Ctrl-N) untuk navigasi selanjutnya
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- (Ctrl-P) untuk navigasi sebelumnya
				["<C-p>"] = cmp.mapping.select_prev_item(),
				-- (Ctrl-B) untuk scroll dokumentasi ke atas
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				-- (Ctrl-F) untuk scroll dokumentasi ke bawah
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- (Enter) untuk konfirmasi pilihan
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				-- (Ctrl-Space) untuk menampilkan daftar suggestion
				["<C-Space>"] = cmp.mapping.complete({}),

				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump() -- Lompat ke bagian berikutnya dalam snippet
					end
				end, { "i", "s" }),

				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1) -- Lompat ke bagian sebelumnya dalam snippet
					end
				end, { "i", "s" }),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item() -- Pilih item berikutnya
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item() -- Pilih item sebelumnya
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{
					name = "lazydev",
					group_index = 0,
				},
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})
	end,
}

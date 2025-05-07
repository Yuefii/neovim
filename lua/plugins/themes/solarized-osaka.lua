return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparant = true,
			})
			vim.cmd("colorscheme solarized-osaka")

			local function set_highlight(groups)
				for _, group in ipairs(groups) do
					vim.api.nvim_set_hl(0, group[1], group[2])
				end
			end

			set_highlight({
				{ "TelescopeNormal", { bg = "NONE" } },
				{ "TelescopeBorder", { bg = "NONE" } },
				{ "TelescopePromptNormal", { bg = "NONE" } },
				{ "TelescopePromptBorder", { bg = "NONE" } },
				{ "TelescopeResultsNormal", { bg = "NONE" } },
				{ "TelescopeResultsBorder", { bg = "NONE" } },
				{ "TelescopePreviewNormal", { bg = "NONE" } },
				{ "TelescopePreviewBorder", { bg = "NONE" } },
			})

			set_highlight({
				{ "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" } },
				{ "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" } },
				{ "NeoTreeEndOfBuffer", { bg = "NONE", ctermbg = "NONE" } },
				{ "NeoTreeWinSeparator", { bg = "NONE", ctermbg = "NONE" } },
			})
		end,
	},
}

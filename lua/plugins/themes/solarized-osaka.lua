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
			vim.cmd([[
                highlight NormalFloat guibg=NONE ctermbg=NONE
                highlight FloatBorder guibg=NONE ctermbg=NONE
            ]])
			vim.cmd([[
                highlight TelescopeNormal guibg=NONE
                highlight TelescopeBorder guibg=NONE
                highlight TelescopePromptNormal guibg=NONE
                highlight TelescopePromptBorder guibg=NONE
                highlight TelescopeResultsNormal guibg=NONE
                highlight TelescopeResultsBorder guibg=NONE
                highlight TelescopePreviewNormal guibg=NONE
                highlight TelescopePreviewBorder guibg=NONE
            ]])
			vim.cmd([[
                highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
                highlight NeoTreeNormal guibg=NONE ctermbg=NONE
                highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
                highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE
            ]])
		end,
	},
}

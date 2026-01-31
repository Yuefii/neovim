return {
	"jwalton512/vim-blade",
	ft = "blade",
	config = function()
		vim.g.blade_custom_directives = {
			"vite",
			"viteReactRefresh",
			"livewire",
			"livewire\\:styles",
			"livewire\\:scripts",
			"push",
			"stack",
			"endpush",
		}
	end,
}
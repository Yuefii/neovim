return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				style = "#60a5fa",
			},
			line_num = {
				enable = true,
				style = "#60a5fa",
			},
		})
	end,
}

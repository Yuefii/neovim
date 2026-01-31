return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status").has_updates

		-- Colors
		local colors = {
			red = "#cc241d",
			green = "#98971a",
			yellow = "#d79921",
			blue = "#458588",
			purple = "#b16286",
			orange = "#d65d0e",
			grey = "#928374",
			fg = "#ebdbb2",
			bg = "#282828",
			lazy_bg = "#3c3836",
			inactive_bg = "#1d2021",
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- Components
		local config = {
			options = {
				icons_enabled = true,
				theme = "gruvbox",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "dashboard", "NvimTree", "neo-tree" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "", right = "" } } },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "", warn = "", info = "", hint = "" },
						colored = true,
						update_in_insert = false,
					},
					{
						"filename",
						path = 1,
						symbols = {
							modified = "[+]",
							readonly = "[-]",
							unnamed = "[No Name]",
						},
						cond = conditions.buffer_not_empty,
					},
				},
				lualine_x = {
					{
						lazy_status,
						cond = conditions.hide_in_width,
						color = { fg = colors.orange },
					},
					{
						"diff",
						symbols = { added = "+", modified = "~", removed = "-" },
						cond = conditions.hide_in_width and conditions.check_git_workspace,
						color = { fg = colors.grey },
					},
					{
						function()
							local buf = vim.api.nvim_get_current_buf()
							local clients = vim.lsp.get_clients({ bufnr = buf })
							if #clients > 0 then
								local client_names = {}
								for _, client in ipairs(clients) do
									table.insert(client_names, client.name)
								end
								return "[" .. table.concat(client_names, ", ") .. "]"
							end
							return ""
						end,
						icon = "",
						color = { fg = colors.purple },
						cond = conditions.hide_in_width,
					},
					{
						"encoding",
						fmt = string.upper,
						cond = conditions.hide_in_width,
					},
					{
						"fileformat",
						fmt = string.upper,
						symbols = {
							unix = "",
							dos = "⌘",
							mac = "",
						},
						cond = conditions.hide_in_width,
					},
				},
				lualine_y = { { "filetype", icon_only = false, colored = true } },
				lualine_z = {
					{
						"location",
						padding = { left = 1, right = 1 },
					},
					{
						"progress",
						padding = { left = 0, right = 1 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "[+]",
							readonly = "[-]",
							unnamed = "[No Name]",
						},
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "neo-tree", "trouble" },
		}

		lualine.setup(config)
	end,
}
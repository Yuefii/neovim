return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		local function gitignore_patterns()
			local patterns = {}
			local gitignore = io.open(".gitignore", "r")
			if gitignore then
				for line in gitignore:lines() do
					line = line:match("^%s*(.-)%s*$")
					if line ~= "" and not line:match("^#") then
						line = line:gsub("%.", "%%.")
						if line:sub(-1) == "/" then
							line = line .. ".*"
						end
						table.insert(patterns, line)
					end
				end
				gitignore:close()
			end
			local fallback = { "%.o", "%.class", "%.lock", "%.cache", "__pycache__" }
			for _, v in ipairs(fallback) do
				table.insert(patterns, v)
			end

			return patterns
		end

		telescope.setup({
			defaults = {
				file_ignore_patterns = gitignore_patterns(),
				preview = {
					treesitter = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		vim.keymap.set("n", "<leader>nf", function()
			builtin.find_files({
				prompt_title = "New file",
				hidden = true,

				attach_mappings = function(_, map)
					map("i", "<CR>", function(prompt_bufnr)
						local input = action_state.get_current_line()
						actions.close(prompt_bufnr)

						if input == "" then
							return
						end

						-- ambil directory dari path
						local dir = vim.fn.fnamemodify(input, ":h")

						-- buat folder kalau belum ada
						if dir ~= "." then
							vim.fn.system({ "mkdir", "-p", dir })
						end

						-- buka / buat file
						vim.cmd("edit " .. vim.fn.fnameescape(input))
					end)

					return true
				end,
			})
		end, { desc = "New file (Telescope + mkdir)" })
	end,
}

return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		-- Fungsi untuk menambahkan padding kiri ke setiap baris teks
		local function add_left_padding(lines, padding)
			local pad = string.rep(" ", padding)
			for i, line in ipairs(lines) do
				lines[i] = pad .. line
			end
			return lines
		end

		-- Jumlah spasi kiri yang diinginkan
		local left_padding = 8
		local left_padding_header = 5

		local time = os.date("⏰ %H:%M:%S")

		dashboard.section.header.val = add_left_padding({
			"██╗   ██╗██╗   ██╗███████╗███████╗██╗██╗",
			"╚██╗ ██╔╝██║   ██║██╔════╝██╔════╝██║██║",
			" ╚████╔╝ ██║   ██║█████╗  █████╗  ██║██║",
			"  ╚██╔╝  ██║   ██║██╔══╝  ██╔══╝  ██║██║",
			"   ██║   ╚██████╔╝███████╗██║     ██║██║",
			"   ╚═╝    ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝",
		}, left_padding_header)

		dashboard.section.custom_text = {
			type = "text",
			val = add_left_padding({
				"⏰ Time     : " .. os.date("%H:%M:%S"),
				"📆 Date     : " .. os.date("%A, %d %B %Y"),
				"",
				"Welcome to Neovim!",
				"Have a productive day😊",
				"",
			}, left_padding),
			opts = {
				position = "left",
				hl = "Comment",
			},
		}

		dashboard.section.top_buttons.val = {
			dashboard.button("e", "📄  New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
			dashboard.button("r", "🕘  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("u", "🔄  Update Plugins", ":Lazy update<CR>"),
			dashboard.button("l", "📦  Lazy", ":Lazy<CR>"),
			dashboard.button("q", "❌  Quit", ":qa<CR>"),
		}

		-- Hilangkan MRU jika tidak dibutuhkan
		dashboard.section.mru.val = {}
		dashboard.section.mru_cwd.val = {}

		-- Urutkan layout dashboard
		dashboard.config.layout = {
			{ type = "padding", val = 1 },
			dashboard.section.header,
			{ type = "padding", val = 1 },
			dashboard.section.custom_text,
			{ type = "padding", val = 2 },
			dashboard.section.top_buttons,
		}

		alpha.setup(dashboard.config)
	end,
}

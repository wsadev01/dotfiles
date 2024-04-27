return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function()
		-- disable until lualine loads
		vim.opt.laststatus = 0
	end,
	opts = function()
		-- miasma colors
		local colors = {
			fg = "#d6deeb",
			bg = "#021727",
			black = "#000503",
			folded_bg = "#092135",
			cursor_fg = "#805a3e",
			cursor_bg = "#80a4c2",
			line_number_fg = "#4b6479",
			line_number_active_fg = "#c5e4fc",
			sign_add = "#9ccc65",
			sign_change = "#e2b93d",
			sign_delete = "#ef5350",
			indent_guide = "#1f395d",
			indent_guide_active = "#7e97ac",
			visual = "#1d3b53",
			match_paren = "#1e364a",
			search_blue = "#063e5d",
			incremental_search_blue = "#2E485C",
			error_red = "#ef5350",
			word_highlight = "#33384d",
			word_highlight_write = "#2f3350",
			changed = "#a2bffc",
			quickfix_line = "#0e293f",
			ui_border = "#5f7e97",
			ui_border2 = "#20395d",
			nvim_tree_file = "#89a4bb",
			nvim_tree_indent_marker = "#585858",
			tab_active_bg = "#0b2942",
			tab_inactive_bg = "#01111d",
			title = "#82b1ff",
			parameter = "#d7dbe0",
			string_delimiter = "#d9f5dd",
			dark = "#010d18",
			dark2 = "#021320",
			dark3 = "#99b76d23",
			white = "#ffffff",
			white2 = "#eeefff",
			dark_white = "#cccccc",
			gray = "#262a39",
			gray2 = "#d2dee7",
			gray3 = "#36414a",
			gray4 = "#d6deeb80",
			gray5 = "#969696",
			gray6 = "#7e97ac",
			light_blue = "#78ccf0",
			blue = "#82aaff",
			blue2 = "#0b253a",
			blue3 = "#122d42",
			blue4 = "#1b90dd4d",
			blue5 = "#234d70",
			blue6 = "#234d708c",
			blue7 = "#395a75",
			blue8 = "#5ca7e4",
			blue9 = "#5f7e9779",
			blue10 = "#697098",
			blue11 = "#8eace3",
			blue12 = "#b2ccd6",
			blue13 = "#072232",
			blue14 = "#273845",
			blue15 = "#169fff",
			green = "#c5e478",
			green2 = "#6CC85E",
			light_cyan = "#caece6",
			cyan = "#6ae9f0",
			cyan2 = "#7fdbca",
			cyan3 = "#7fdbcaff",
			cyan4 = "#80cbc4",
			cyan5 = "#baebe2",
			dark_cyan = "#637777",
			light_red = "#ff869a",
			red = "#ff5874",
			red2 = "#ff6363",
			red3 = "#ef535090",
			dark_red = "#ab0300f2",
			light_orange = "#ecc48d",
			orange = "#f78c6c",
			orange2 = "#ffcb8b",
			light_yellow = "#faf39f",
			yellow = "#ffd602",
			yellow2 = "#b39554",
			yellow3 = "#fad430",
			yellow4 = "#ffeb95",
			yellow5 = "#ffeb95cc",
			light_purple = "#a599e9",
			purple = "#7e57c2",
			purple2 = "#5166F0",
			purple3 = "#da70d6",
			purple4 = "#7986e7",
			dark_purple = "#2E2D5E",
			magenta = "#c792ea",
			magenta2 = "#c789d6",
			magenta3 = "#d1aaff",
			magenta4 = "#ff2c83",
			magenta5 = "#e2a2f433",
			magenta6 = "#f6bbe533",
		}
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width_first = function()
				return vim.fn.winwidth(0) > 80
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 70
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.dark_red,
			i = colors.light_cyan,
			v = colors.blue15,
			[""] = colors.blue15,
			V = colors.blue15,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.yellow,
			Rv = colors.yellow,
			cv = colors.yellow,
			ce = colors.yellow,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}

		local fg_color = function(mode)
			if mode == "n" then
				return colors.white2
			elseif mode == "v" then
				return colors.black
			elseif mode == "V" then
				return colors.black
			elseif mode == "i" then
				return colors.black
			else
				return colors.black
			end
		end

		-- config
		local config = {
			options = {
				-- remove default sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					-- setting defaults to statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				-- clear defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- clear for later use
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- clear defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- clear for later use
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- insert active component in lualine_c at left section
		local function active_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- insert inactive component in lualine_c at left section
		local function inactive_left(component)
			table.insert(config.inactive_sections.lualine_c, component)
		end

		-- insert active component in lualine_x at right section
		local function active_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- insert inactive component in lualine_x at right section
		local function inactive_right(component)
			table.insert(config.inactive_sections.lualine_x, component)
		end

		-- dump object contents
		local function dump(o)
			if type(o) == 'table' then
				local s = ''
				for k, v in pairs(o) do
					if type(k) ~= 'number' then k = '"' .. k .. '"' end
					s = s .. dump(v) .. ','
				end
				return s
			else
				return tostring(o)
			end
		end

		-- active left section
		active_left({
			function()
				local icon
				local ok, devicons = pcall(require, 'nvim-web-devicons')
				if ok then
					icon = devicons.get_icon(vim.fn.expand('%:t'))
					if icon == nil then
						icon = devicons.get_icon_by_filetype(vim.bo.filetype)
					end
				else
					if vim.fn.exists('*WebDevIconsGetFileTypeSymbol') > 0 then
						icon = vim.fn.WebDevIconsGetFileTypeSymbol()
					end
				end
				if icon == nil then
					icon = ''
				end
				return icon:gsub("%s+", "")
			end,
			color = function()
				return { bg = mode_color[vim.fn.mode()], fg = fg_color(vim.fn.mode())}
			end,
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
		})
		active_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = function()
				return { bg = mode_color[vim.fn.mode()], fg = fg_color(vim.fn.mode()) }
			end,
			padding = { left = 3, right = 1 },
			separator = { right = "▓▒░" },
			symbols = {
				modified = "󰶻 ",
				readonly = " ",
				unnamed = " ",
				newfile = " ",
			},
		})
		active_left({
			"branch",
			icon = "",
			color = { bg = colors.dark_purple, fg = colors.white},
			padding = { left = 0, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})

		-- inactive left section
		inactive_left({
			function()
				return ''
			end,
			cond = conditions.buffer_not_empty,
			color = { bg = colors.dark, fg = colors.grey },
			padding = { left = 1, right = 1 },
		})
		inactive_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { bg = colors.dark, fg = colors.grey },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
			symbols = {
				modified = "",
				readonly = "",
				unnamed = "",
				newfile = "",
			},
		})

		-- active right section
		active_right({
			function()
				local clients = vim.lsp.get_active_clients()
				local clients_list = {}
				for _, client in pairs(clients) do
					if (not clients_list[client.name]) then
						table.insert(clients_list, client.name)
					end
				end
				local lsp_lbl = dump(clients_list):gsub("(.*),", "%1")
				return lsp_lbl:gsub(",", ", ")
			end,
			icon = " ",
			color = { bg = colors.dark_purple, fg = colors.white },
			padding = { left = 1, right = 1 },
			cond = conditions.hide_in_width_first,
			separator = { right = "▓▒░", left = "░▒▓" },
		})

		active_right({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			colored = false,
			color = { bg = colors.magenta, fg = colors.dark },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})
		active_right({
			"searchcount",
			color = { bg = colors.cyan, fg = colors.dark },
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░", left = "░▒▓" },
		})
		active_right({
			"location",
			color = { bg = colors.dark, fg = colors.white },
			padding = { left = 1, right = 0 },

			separator = { right = "▓▒░", left = "░▒▓" },
		})
		active_right({
			"o:encoding",
			fmt = string.upper,
			cond = conditions.hide_in_width,
			padding = { left = 1, right = 1 },
			color = { bg = colors.dark2, fg = colors.dark_white},
			separator = { right = "▓▒░" }
		})
		active_right({
			"fileformat",
			fmt = string.lower,
			icons_enabled = false,
			cond = conditions.hide_in_width,
			color = { bg = colors.dark3, fg = colors.dark_white},
			separator = { right = "▓▒░" },
			padding = { left = 0, right = 3 },
		})

		-- inactive right section
		inactive_right({
			"location",
			color = { bg = colors.dark, fg = colors.grey },
			padding = { left = 1, right = 0 },
			separator = { left = "░▒▓" },
		})
		inactive_right({
			"progress",
			color = { bg = colors.dark, fg = colors.grey },
			cond = conditions.hide_in_width,
			padding = { left = 1, right = 1 },
			separator = { right = "▓▒░" },
		})
		inactive_right({
			"fileformat",
			fmt = string.lower,
			icons_enabled = false,
			cond = conditions.hide_in_width,
			color = { bg = colors.dark, fg = colors.grey },
			separator = { right = "▓▒░" },
			padding = { left = 0, right = 1 },
		})
		--
		return config
	end,
}

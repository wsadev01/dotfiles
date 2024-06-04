-- ██╗      █████╗ ███████╗██╗   ██╗         Z
-- ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝      Z
-- ██║     ███████║  ███╔╝  ╚████╔╝    z
-- ██║     ██╔══██║ ███╔╝    ╚██╔╝   z
-- ███████╗██║  ██║███████╗   ██║
-- ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝

local pluginspath = vim.fn.stdpath("data") .. "/lazy"
local lazypath = pluginspath .. "/lazy.nvim"
-- install lazy
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("lazy just installed, please restart neovim")
	return
end

-- install plugins
lazy.setup({
	spec = {
		require('plugins.lastplace'),
		require("plugins.terminal"),
		require("plugins.chadtree"),
		require("plugins.osc52-yank"),
		require("plugins.scrollbar"),
		require("plugins.gitsigns"),
		require("plugins.indent"),
		require("plugins.luasnip"),
		require("plugins.which-key"),
		require("plugins.telescope"),
		require("plugins.treesitter"),
		require("plugins.guess-indent"),
		require("plugins.mason"),
		require("plugins.lsp"),
		require("plugins.cmp"),
		require("plugins.trouble"),
		require("plugins.colorizer"),
		require("plugins.surround"),
		require("plugins.tint"),
		require("plugins.ansi"),
		require("plugins.lualine"),
		require("plugins.increname"),
		require("plugins.fzf"),
		require("plugins.devicons"),
		require("plugins.matchparen"),
		require("plugins.alpha"),
		require("plugins.dadbod"),
		require("plugins.mason-dap"),
		require("plugins.theme")
	},
	dev = {
		path = "~/.local/src",
	},
	lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
	ui = {
		size = { width = 0.8, height = 0.8 },
		wrap = true,
		border = "shadow",
		icons = require("utils.icons").lazy,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("toggleterm").setup{size=20, direction=vertical,on_open=function()vim.cmd("startinsert")end}
require("remember").setup{}


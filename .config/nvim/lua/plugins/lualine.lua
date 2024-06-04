return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function()
		-- disable until lualine loads
		vim.opt.laststatus = 0
	end,
	opts = function()
		require('lualine').setup {
			options = {
				theme = 'gruvbox-material',             -- Set lualine theme to gruvbox-material
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
		}
		-- miasma colors
		-- ▓▒░
	end,
}

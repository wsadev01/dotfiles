return {
	"corei8/gruvbox-material.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.g.gruvbox_material_enable_italic = true
    vim.cmd.colorscheme('gruvbox-material')
		vim.cmd('set background=dark')
		vim.g.gruvbox_material_background = 'dark'
		vim.g.gruvbox_material_foreground = 'soft'
	end,
}

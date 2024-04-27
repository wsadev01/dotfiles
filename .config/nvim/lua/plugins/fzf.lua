return {
  'ibhagwan/fzf-lua',
	event = "VeryLazy",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { "<leader>mc",  function() require("fzf-lua").commands() end,        desc = "Search commands" },
    { "<leader>mC",  function() require("fzf-lua").command_history() end, desc = "Search command history" },
    { "<leader>mf",  function() require("fzf-lua").files() end,           desc = "Find files" },
    { "<leader>mo",  function() require("fzf-lua").oldfiles() end,        desc = "Find files" },
    { "<leader>mh",  function() require("fzf-lua").highlights() end,      desc = "Search highlights" },
    { "<leader>mM",  function() require("fzf-lua").marks() end,           desc = "Search marks" },
    { "<leader>mk",  function() require("fzf-lua").keymaps() end,         desc = "Search keymaps" },
    { "<leader>mt",  function() require("fzf-lua").treesitter() end,      desc = "Search treesitter" },
    { "<leader>mgf", function() require("fzf-lua").git_files() end,       desc = "Find git files" },
    { "<leader>mgb", function() require("fzf-lua").git_branches() end,    desc = "Search git branches" },
    { "<leader>mgc", function() require("fzf-lua").git_commits() end,     desc = "Search git commits" },
    { "<leader>mgC", function() require("fzf-lua").git_bcommits() end,    desc = "Search git buffer commits" },
    { "<leader>bc",  function() require("fzf-lua").git_bcommits() end,    desc = "Search git buffer commits" },
    { "<leader>m/",  function() require("fzf-lua").resume() end,          desc = "Resume FZF" },
  },
  config = function()
    local fzf = require('fzf-lua')
		fzf.setup({
      keymap = {
        fzf = {
          ['CTRL-Q'] = 'select-all+accept',
        },
      },
    })
    fzf.register_ui_select()
  end,
}

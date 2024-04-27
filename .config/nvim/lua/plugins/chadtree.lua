return {
  "ms-jpq/chadtree",
  setup = function()
    vim.g.chadtree_settings = {
      view = {
        width = 30,
        height = 30,
      },
    }
  end,
  keys = {
    { "<leader>m<space>", ":CHADopen<CR>", desc = "Toggle ChadTree" },
  },
}


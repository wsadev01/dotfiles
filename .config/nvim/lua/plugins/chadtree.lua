return {
  "ms-jpq/chadtree",
  setup = function()
    vim.g.chadtree_settings = {
      view = {
        width = 0,
        height = 30,
      },
      theme ={
        text_colour_set ="nerdtree_syntax_light",
        icon_glyph_set ="ascii"
      }
    }
  end,
  keys = {
    { "<leader>m<space>", ":CHADopen<CR>", desc = "Toggle ChadTree" },
  },
}


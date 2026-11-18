return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  opts = {
    headerMaxWidth = 80,
  },
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open()
      end,
      mode = { "n", "x" },
      desc = "Search and Replace (Project)",
    },
    {
      "<leader>sf",
      function()
        require("grug-far").open({
          prefills = { paths = vim.fn.expand("%") },
        })
      end,
      mode = { "n", "x" },
      desc = "Search and Replace (Current File)",
    },
  },
}

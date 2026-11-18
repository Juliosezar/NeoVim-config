return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    scope = { enabled = false },
    indent = {
      char = "│",
      tab_char = "│",
    },
    exclude = {
      filetypes = { "help", "alpha", "NvimTree", "lazy", "mason", "snacks_notif" },
    },
  },
}

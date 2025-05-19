return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: for file icons
  config = function()
    require("nvim-tree").setup()
  end,
}

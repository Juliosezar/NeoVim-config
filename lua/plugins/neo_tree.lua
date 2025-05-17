return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",  -- use the latest stable version
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })

  end,
}


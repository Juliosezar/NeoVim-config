return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      -- Groups (which-key reads individual plugin keymap `desc` automatically)
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "cargo / code" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>n", group = "notifications / nav" },
      { "<leader>q", group = "quit" },
      { "<leader>r", group = "rust / resize / diag" },
      { "<leader>s", group = "search / replace" },
      { "<leader>t", group = "terminal" },
      { "<leader>v", group = "venv" },
      { "<leader>w", group = "window" },
      { "<leader><leader>", group = "window move" },

      -- Only needed for init.lua mappings that don't have a `desc` yet
      { "<leader>ww", desc = "Save" },
      { "<leader>wq", desc = "Save and quit" },
      { "<leader>QQ", desc = "Force quit" },
      { "<leader>wv", desc = "Split vertical" },
      { "<leader>ws", desc = "Split horizontal" },
      { "<leader>wd", desc = "Close window" },
      { "<leader>wc", desc = "Close window" },
      { "<leader>w=", desc = "Equal size" },
      { "<leader>w_", desc = "Max height" },
      { "<leader>w|", desc = "Max width" },
      { "<leader><leader>h", desc = "Window left" },
      { "<leader><leader>l", desc = "Window right" },
      { "<leader><leader>j", desc = "Window down" },
      { "<leader><leader>k", desc = "Window up" },
      { "<leader>r<Up>", desc = "Taller" },
      { "<leader>r<Down>", desc = "Shorter" },
      { "<leader>r<Right>", desc = "Wider" },
      { "<leader>r<Left>", desc = "Narrower" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

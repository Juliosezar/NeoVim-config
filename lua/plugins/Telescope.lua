return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5', -- stable release
  dependencies = {
    'nvim-lua/plenary.nvim'  -- required dependency
  },
  cmd = "Telescope",  -- lazy-load on command
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          horizontal = { preview_width = 0.55 },
          vertical = { mirror = false },
        },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
      }
    }
  end
}


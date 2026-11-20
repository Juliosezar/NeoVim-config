return {
  "linux-cultist/venv-selector.nvim",
  cmd = "VenvSelect",
  ft = "python",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  opts = {
    options = {
      notify_user_on_venv_activation = true,
      log_level = "debug",
    },
  },
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", ft = "python", desc = "Select VirtualEnv" },
  },
}

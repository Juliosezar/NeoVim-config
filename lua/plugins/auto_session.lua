return {
  "rmagatti/auto-session",
  lazy = false, -- load on startup
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
    })

    -- Optional keymaps
    vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session" })
    vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete session" })
  end
}


return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")

    iron.setup {
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            command = { "ipython" }, -- or "python3"
          },
        },
        repl_open_cmd = "vertical botright 80 split",
      },
      keymaps = {
        send_motion = "<leader>sc",
        visual_send = "<leader>sc",
        send_line = "<leader>sl",
        send_file = "<leader>sf",
        send_until_cursor = "<leader>su",
        send_mark = "<leader>sm",
        mark_motion = "<leader>mc",
        mark_visual = "<leader>mc",
        clear = "<leader>cl",
        interrupt = "<leader>si",
        exit = "<leader>sq",
      },
    }

    -- Optional keybinding to open REPL
    vim.keymap.set("n", "<leader>sr", "<cmd>IronRepl<cr>", { desc = "Open REPL" })
  end,
}


return {
  "ecthelionvi/NeoComposer.nvim",
  dependencies = { "kkharji/sqlite.lua" }, -- Required dependency
  config = function()
    require("NeoComposer").setup({
      keymaps = {
        play_macro = "Q",
        yank_macro = "yq",
        stop_macro = "cq",
        toggle_record = "q",
      },
      notify = true,
      delay_timer = 150,
      highlight = {
        on_play = true,
        on_record = true,
        clear = 500,
      },
    })

    -- Optional: assign to global for statusline use
    vim.g.neo_composer_recording_status = require("NeoComposer.ui").status_recording()
  end,
  event = "VeryLazy", -- or any appropriate lazy loading trigger
}


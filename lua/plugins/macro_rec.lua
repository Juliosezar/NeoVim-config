return  {
    "ecthelionvi/NeoComposer.nvim",
    event = "VeryLazy",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {
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
    },
  }

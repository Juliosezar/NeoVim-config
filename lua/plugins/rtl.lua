return {
  "nyngwang/rosetta.nvim",
  config = function()
    require("rosetta").setup({
      bidi = {
        enabled = true,
        user_commands = true,
        intuitive_delete = true,
        register = "b",
        revert_before_saving = true,
      },
      keyboard = {
        enabled = true,
        user_commands = true,
        silent = false,
      },
      lang = {
        default = "english",
        english = {
          keymap = "",
          rtl = false,
          unicode_range = { "0020-007F" },
        },
        persian = {
          keymap = "farsi_utf-8",
          rtl = true,
          unicode_range = { "0600-06FF" },
          options = {
            delcombine = true,
          },
        },
      },
    })
  end,
}


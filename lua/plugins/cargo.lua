return {
  "nwiizo/cargo.nvim",
  build = "cargo build --release",
  config = function()
    require("cargo").setup({
      auto_close = false,
    })
  end,
  ft = { "rust" },
  cmd = {
    "CargoBench",
    "CargoBuild", 
    "CargoClean",
    "CargoDoc",
    "CargoNew",
    "CargoRun",
    "CargoRunTerm",
    "CargoTest",
    "CargoUpdate",
    "CargoCheck",
    "CargoClippy",
    "CargoAdd",
    "CargoRemove",
    "CargoFmt",
    "CargoFix"
  },
	  keymaps = {
    close = "q",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    scroll_top = "gg",
    scroll_bottom = "G",
    interrupt = "<C-c>",
    toggle_wrap = "w",
    copy_output = "y",
    clear_output = "c",
  },
}

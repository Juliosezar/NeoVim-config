return {
  "nwiizo/cargo.nvim",
  build = "cargo build --release",
  config = function()
    require("cargo").setup({
      auto_close = false,
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
    })
  end,
  ft = { "rust" },
  cmd = {
    "CargoBench", "CargoBuild", "CargoClean", "CargoDoc", "CargoNew",
    "CargoRun", "CargoRunTerm", "CargoTest", "CargoUpdate", "CargoCheck",
    "CargoClippy", "CargoAdd", "CargoRemove", "CargoFmt", "CargoFix",
  },
  keys = {
    { "<leader>cb", "<cmd>CargoBuild<CR>",  ft = "rust", desc = "Cargo Build" },
    { "<leader>cr", "<cmd>CargoRunTerm<CR>", ft = "rust", desc = "Cargo Run" },
    { "<leader>ct", "<cmd>CargoTest<CR>",   ft = "rust", desc = "Cargo Test" },
    { "<leader>cc", "<cmd>CargoCheck<CR>",  ft = "rust", desc = "Cargo Check" },
    { "<leader>cl", "<cmd>CargoClippy<CR>", ft = "rust", desc = "Cargo Clippy" },
    { "<leader>cf", "<cmd>CargoFmt<CR>",    ft = "rust", desc = "Cargo Format" },
    { "<leader>cu", "<cmd>CargoUpdate<CR>", ft = "rust", desc = "Cargo Update" },
    { "<leader>cd", "<cmd>CargoDoc<CR>",    ft = "rust", desc = "Cargo Doc" },
    { "<leader>cx", "<cmd>CargoClean<CR>",  ft = "rust", desc = "Cargo Clean" },
    { "<leader>ca", "<cmd>CargoAdd<CR>",    ft = "rust", desc = "Cargo Add Dep" },
    { "<leader>cn", "<cmd>CargoNew<CR>",    ft = "rust", desc = "Cargo New" },
  },
}

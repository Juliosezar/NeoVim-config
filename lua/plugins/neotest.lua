return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          runner = "pytest",
          python = ".venv/bin/python",
        }),
        require("neotest-rust"),
      },
    })
  end,
  keys = {
    { "ttt", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
    { "ttf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "tts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    { "tto", function() require("neotest").output.open({ enter = true }) end, desc = "Show Output" },
  },
}

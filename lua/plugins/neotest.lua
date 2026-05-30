return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python", -- The python adapter
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          -- Use pytest instead of unittest
          runner = "pytest",
          -- neotest-python will automatically look for virtual envs (like .venv)
          -- in your project root, but you can explicitly fall back to a specific path if needed:
          python = ".venv/bin/python",
        }),
      },
    })
  end,
  -- Practical keymaps to run and interact with tests
  keys = {
    { "ttt", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
    { "ttf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "tts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    { "tto", function() require("neotest").output.open({ enter = true }) end, desc = "Show Output" },
  },
}

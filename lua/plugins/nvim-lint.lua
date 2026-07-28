return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      rust = { "clippy" },
    }

    -- Auto-lint on insert leave and save
    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("nvim_lint_custom", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

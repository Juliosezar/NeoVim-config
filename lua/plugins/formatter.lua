return {
  "stevearc/conform.nvim",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fo",
      function()
        require("conform").format({
          lsp_format = "fallback",
          async = false,
          timeout_ms = 1000,
        })
      end,
      mode = { "n", "x" },
      desc = "Format buffer or range",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_organize_imports", "ruff_format" },
      rust = { "rustfmt" },
      htmldjango = { "djlint" },
      -- Vue & frontend development:
      vue = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      css = { "prettierd" },
      json = { "prettierd" },
    },
    formatters = {
      djlint = {
        prepend_args = {
          "--profile", "django",
          "--max-line-length", "0",
          "--max-attribute-length", "0",
        },
      },
    },
  },
}

return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "black" },
        rust = { "rustfmt" },
        html = { "prettier" },
      },
    })
  end,
}


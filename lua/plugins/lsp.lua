return {
  {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
    })
  end,
}, {

    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "rust_analyzer" },
        automatic_installation = true,
      })
    end,
  },
}


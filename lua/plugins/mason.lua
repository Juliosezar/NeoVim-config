-- return {
--     "mason-org/mason.nvim",
--     "mason-org/mason-lspconfig.nvim",
--     "neovim/nvim-lspconfig",
-- require("mason-lspconfig").setup({
--   ensure_installed = {
--     "pyright",
--     "rust_analyzer",
--     "jedi_language_server",
--     "html",
--     "cssls",
--     "tsserver",
--   },
-- })
-- }



return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",          -- Python
        "rust_analyzer",    -- Rust
        "jedi_language_server", -- Python Jedi
        "html",             -- HTML
        "cssls",            -- CSS
        "tsserver",         -- JavaScript/TypeScript
      },
    })
  end,
}


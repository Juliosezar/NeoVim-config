return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        "python", "rust", "html", "htmldjango", "css", "javascript",
        "lua", "sql", "json", "toml", "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

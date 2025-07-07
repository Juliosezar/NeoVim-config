return {
  {
    "nvimtools/none-ls.nvim", -- This is the updated null-ls
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.ruff,

          -- Rust
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.diagnostics.clippy,
        },
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "black", "ruff", "rustfmt", "clippy" }, -- Auto-install
        automatic_installation = true,
      })
    end,
  },
}


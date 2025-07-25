return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Python
          null_ls.builtins.formatting.black,
        --  null_ls.builtins.diagnostics.flake8, -- Use flake8 as a fallback

          -- Rust
        --  null_ls.builtins.formatting.rustfmt,
        --  null_ls.builtins.diagnostics.clippy,
        },
      })
    end,
  }
}


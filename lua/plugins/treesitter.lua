return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- The 'main' branch does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- 1. Install your preferred parsers
    ts.install({
      "python",
      "rust",
      "html",
      "htmldjango",
      "css",
      "javascript",
      "lua",
      "sql",
      "json",
      "toml",
      "yaml",
      "markdown",
      "markdown_inline",
      "vue",
      "typescript",
    })

    -- 2. Enable Treesitter highlighting and indentation per filetype
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        -- Starts Treesitter highlighting natively for the buffer
        pcall(vim.treesitter.start, args.buf)

        -- Enables Treesitter-based indentation
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

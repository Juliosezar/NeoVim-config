return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },

  config = function()
    -- 1. Apply blink.cmp + foldingRange capabilities globally BEFORE enabling servers
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    vim.lsp.config("*", { capabilities = capabilities })

    -- 2. Configure Pyright (let venv-selector.nvim manage pythonPath)
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            autoImportCompletions = true,
            indexing = true,
            typeCheckingMode = "basic",
          },
        },
      },
    })

    -- 3. Configure TypeScript / JavaScript (with Vue plugin integration)
    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    vim.lsp.config("ts_ls", {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
      filetypes = { "javascript", "typescript", "vue" },
    })

    -- 4. Configure Tailwind CSS
    vim.lsp.config("tailwindcss", {
      filetypes = { "html", "htmldjango", "css", "vue", "javascript", "typescript" },
    })

    -- 5. Setup Mason & auto-enable installed servers (excluding rust_analyzer for rustaceanvim)
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "ruff",
        "html",
        "cssls",
        "ts_ls",
        "vue_ls",
        "tailwindcss",
        "lua_ls",
      },
      automatic_enable = {
        exclude = { "rust_analyzer" },
      },
    })
  end,
}

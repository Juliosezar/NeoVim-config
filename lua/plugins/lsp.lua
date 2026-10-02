return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "rust_analyzer",
        "ruff",
        "html",
        "cssls",
        "ts_ls",
        "vue_ls", -- Renamed from "volar"
        "tailwindcss",
      },
    })

    -- 1. Apply nvim-cmp capabilities globally to all LSP servers
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Helper function to find python in virtual environments
    local function get_python_path(workspace)
      local venv_candidates = {
        workspace .. "/.venv/bin/python",
        workspace .. "/venv/bin/python",
        workspace .. "/.venv/Scripts/python.exe",
        workspace .. "/venv/Scripts/python.exe",
      }

      for _, path in ipairs(venv_candidates) do
        if vim.uv.fs_stat(path) then
          return path
        end
      end

      if os.getenv("VIRTUAL_ENV") then
        local active_venv = os.getenv("VIRTUAL_ENV") .. "/bin/python"
        if vim.uv.fs_stat(active_venv) then
          return active_venv
        end
      end

      local exepath = vim.fn.exepath("python3")
      if exepath ~= "" then return exepath end
      exepath = vim.fn.exepath("python")
      if exepath ~= "" then return exepath end

      return "python"
    end

    -- 2. Configure Pyright
    vim.lsp.config("pyright", {
      before_init = function(_, config)
        local root_dir = config.root_dir or vim.fn.getcwd()
        config.settings = config.settings or {}
        config.settings.python = config.settings.python or {}
        config.settings.python.pythonPath = get_python_path(root_dir)
      end,
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
          },
        },
      },
      filetypes = { "javascript", "typescript", "vue" },
    })

    -- 4. Configure Tailwind CSS
    vim.lsp.config("tailwindcss", {
      filetypes = { "html", "htmldjango", "css", "vue", "javascript", "typescript" },
    })

    -- 5. Enable all required servers
    local servers = {
      "pyright",
      "rust_analyzer",
      "ruff",
      "html",
      "cssls",
      "ts_ls",
      "vue_ls",
      "tailwindcss",
    }

    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
    -- Auto-organize imports with Ruff before saving
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end,
    })

  end,
}
